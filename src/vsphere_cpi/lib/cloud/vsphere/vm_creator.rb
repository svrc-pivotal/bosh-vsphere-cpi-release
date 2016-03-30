module VSphereCloud
  class VmCreator
    def initialize(memory, disk_size_in_mb, cpu, nested_hardware_virtualization, drs_rules, client, cloud_searcher, logger, cpi, agent_env, file_provider, datacenter, cluster=nil)
      @drs_rules = drs_rules
      @client = client
      @cloud_searcher = cloud_searcher
      @logger = logger
      @cpi = cpi
      @memory = memory
      @disk_size_in_mb = disk_size_in_mb
      @cpu = cpu
      @nested_hardware_virtualization = nested_hardware_virtualization
      @agent_env = agent_env
      @file_provider = file_provider
      @datacenter = datacenter
      @cluster = cluster

      @logger.debug("VM creator initialized with memory: #{@memory}, disk: #{@disk}, cpu: #{@cpu}")
    end

    def create(agent_id, stemcell_cid, networks, persistent_disk_cids, environment)
      vm_cid = "vm-#{SecureRandom.uuid}"
      validate_ip_addresses(networks)
      stemcell_size = get_stemcell_size(stemcell_cid)

      ephemeral_disk_size_in_mb = @disk_size_in_mb + @memory + stemcell_size
      persistent_disks = get_persistent_disks(persistent_disk_cids)
      cluster = get_cluster(persistent_disks, @memory, ephemeral_disk_size_in_mb)
      datastore = get_datastore(cluster, ephemeral_disk_size_in_mb)

      @logger.info("Creating vm: #{vm_cid} on #{cluster.mob} stored in #{datastore.mob}")

      stemcell_vm = replicate_stemcell(cluster, datastore, stemcell_cid)
      # TODO: Replace with stemcell_vm.current_snapshot
      snapshot = stemcell_vm.mob.snapshot.current_snapshot
      disk_controller_key = stemcell_vm.system_disk.controller_key
      pci_controller_key = stemcell_vm.pci_controller.key

      ephemeral_disk_spec = create_ephemeral_disk_spec(datastore, vm_cid, disk_controller_key, @disk_size_in_mb)

      apply_spec = []
      apply_spec << ephemeral_disk_spec

      dvs_index = {}
      networks.each_value do |network|
        apply_spec << create_virtual_nic_spec(network, pci_controller_key, dvs_index)
      end

      stemcell_vm.nics.each do |nic|
        apply_spec << Resources::VM.create_delete_device_spec(nic)
      end

      stemcell_vm.fix_device_unit_numbers(apply_spec)
      config = get_config(@cpu, @memory, apply_spec)
      created_vm = clone_vm(stemcell_vm, vm_cid, cluster.resource_pool, datastore, snapshot, config)

      disks.each do |disk|
        vm.attach_disk(disk)
      end

      created.vm.attach_disks([...])
      begin
        location = @cpi.get_vm_location(
          created_vm.mob,
          datacenter: @datacenter.name,
          datastore: datastore.name,
          vm: created_vm.cid
        )

        env = get_agent_env(created_vm, networks, dvs_index, ephemeral_disk_spec, agent_id, environment)
        @logger.info("Setting VM env: #{env.pretty_inspect}")
        @agent_env.set_env(created_vm.mob, location, env)

        @logger.info("Powering on VM: #{created_vm}")
        created_vm.power_on

        create_drs_rules(created_vm.mob, cluster)
      rescue => e
        e.vm_cid = vm_cid if e.instance_of?(Cloud::NetworkException)
        @logger.info("#{e} - #{e.backtrace.join("\n")}")
        begin
          created_vm.delete if created_vm
        rescue => ex
          @logger.info("Failed to delete vm '#{vm_cid}' with message:  #{ex.inspect}")
        end
        raise e
      end

      vm_cid
    end

    private

    def clone_vm(stemcell_vm, vm_cid, resource_pool, datastore, snapshot, config)
      @logger.info("Cloning vm: #{stemcell_vm} to #{vm_cid}")

      task = @cpi.clone_vm(stemcell_vm.mob,
        vm_cid,
        @datacenter.vm_folder.mob,
        resource_pool.mob,
        datastore: datastore.mob, linked: true, snapshot: snapshot, config: config)
      created_vm_mob = @client.wait_for_task(task)
      Resources::VM.new(vm_cid, created_vm_mob, @client, @logger)
    end

    def create_drs_rules(vm, cluster)
      return if @drs_rules.nil? || @drs_rules.size == 0

      if @drs_rules.size > 1
        raise 'vSphere CPI supports only one DRS rule per resource pool'
      end

      rule_config = @drs_rules.first

      if rule_config['type'] != 'separate_vms'
        raise "vSphere CPI only supports DRS rule of 'separate_vms' type, not '#{rule_config['type']}'"
      end

      drs_rule = VSphereCloud::DrsRule.new(
        rule_config['name'],
        @client,
        @cloud_searcher,
        cluster.mob,
        @logger
      )
      drs_rule.add_vm(vm)
    end

    def create_ephemeral_disk_spec(datastore, vm_cid, disk_controller_key, disk_size_in_mb)
      ephemeral_disk = Resources::EphemeralDisk.new(Resources::EphemeralDisk::DISK_NAME, disk_size_in_mb, datastore, vm_cid)
      ephemeral_disk.create_disk_attachment_spec(disk_controller_key)
    end

    def create_virtual_nic_spec(network, pci_controller_key, dvs_index)
      network_name = network['cloud_properties']['name']
      network_mob = @client.find_by_inventory_path([@datacenter.name, 'network', network_name])
      virtual_nic = Resources::Nic.create_virtual_nic(@cloud_searcher, network_name, network_mob, pci_controller_key, dvs_index)
      Resources::VM.create_add_device_spec(virtual_nic)
    end

    # def get_agent_env(created_vm, networks, environment)
    def get_agent_env(created_vm, networks, dvs_index, ephemeral_disk_spec, agent_id, environment)
      network_env = @cpi.generate_network_env(created_vm.devices, networks, dvs_index)
      disk_env = @cpi.generate_disk_env(created_vm.system_disk, ephemeral_disk_spec.device)
      env = @cpi.generate_agent_env(created_vm.cid, created_vm.mob, agent_id, network_env, disk_env)
      env['env'] = environment
      env
    end

    def get_cluster(persistent_disks, memory, ephemeral_disk_size)
      cluster = @cluster || @datacenter.pick_cluster_for_vm(memory, ephemeral_disk_size, persistent_disks)
      if cluster.ephemeral_datastores.empty?
        raise "Cluster '#{cluster.name}' has no ephemeral datastores"
      end
      cluster
    end

    def get_config(num_cpus, memory, apply_spec)
      config_hash = { memory_mb: memory, num_cpus: num_cpus }
      config_hash.merge!(nested_hv_enabled: true) if @nested_hardware_virtualization

      config = VimSdk::Vim::Vm::ConfigSpec.new(config_hash)
      config.device_change = apply_spec
      config
    end

    def get_datastore(cluster, ephemeral_disk_size)
      @datacenter.pick_ephemeral_datastore(ephemeral_disk_size, cluster.ephemeral_datastores.keys)
    end

    def get_persistent_disks(disk_cids)
      (disk_cids || []).map { |cid| @datacenter.find_disk(cid) }
    end

    # TODO: replace with `stemcell_vm.size`
    def get_stemcell_size(stemcell_cid)
      stemcell_vm = @cpi.stemcell_vm(stemcell_cid)
      raise "Could not find VM for stemcell '#{stemcell_cid}'" if stemcell_vm.nil?

      stemcell_size = @cloud_searcher
        .get_property(stemcell_vm, VimSdk::Vim::VirtualMachine, 'summary.storage.committed', ensure_all: true)
      stemcell_size /= 1024 * 1024
    end

    # TODO: replace with stemcell_vm.replicate
    def replicate_stemcell(cluster, datastore, stemcell_cid)
      stemcell_vm_mob = @cpi.replicate_stemcell(cluster, datastore, stemcell_cid)
      Resources::VM.new(stemcell_cid, stemcell_vm_mob, @client, @logger)
    end

    def validate_ip_addresses(networks)
      conflicts = IPConflictDetector.new(@logger, @client, networks).conflicts
      unless conflicts.empty?
        raise "Cannot create new VM because of IP conflicts with other VMs on the same networks: #{conflicts}"
      end
    end
  end
end
