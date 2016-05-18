module VSphereCloud
  class OptimalDatastorePicker
    DEFAULT_DISK_HEADROOM = 1024

    def initialize(headroom = DEFAULT_DISK_HEADROOM)
      @headroom = headroom
      @available_datastores = {}
    end

    def update(available_datastores={})
      @available_datastores = available_datastores
    end

    # Problem: discover best placement of one-to-disks into one-to-many datastores
    # Constraints: All disks must fit in datastores without exceeding datastore capicities
    # Maximize: The total free space across all datastores by minimizing disk moves
    #
    # This is a variation of the multi-bin packing problem: https://en.wikipedia.org/wiki/Bin_packing_problem
    # The "optimal" implementation is very slow: BigO(datastore_count ** disk_count)
    def optimal_datastore_placements(disk_configurations)
      datastores = deep_copy(@available_datastores)
      datastores.each do |ds_name, props|
        props[:disks] = []
      end
      all_valid_placements = valid_placements(disk_configurations, datastores)

      max_remaining_space = 0
      optimal_placements = []
      all_valid_placements.each do |placement|
        total_free_space = total_remaining_space(placement)
        if total_free_space > max_remaining_space
          optimal_placements = [placement]
          max_remaining_space = total_free_space
        elsif total_free_space == max_remaining_space
          optimal_placements.push(placement)
        end
      end
      optimal_placements
    end

    private

    def valid_placements(disk_configurations, datastores)
      return [] if disk_configurations.empty?

      disk = disk_configurations.first

      combinations = []
      datastores.each do |ds_name, properties|
        if disk[:existing_datastore_name] == ds_name
          additional_space_required = 0
        else
          additional_space_required = disk[:size] + @headroom
        end

        next if properties[:free_space] < additional_space_required
        next unless ds_name =~ Regexp.new(disk[:datastore_pattern])

        stores = deep_copy(datastores)
        stores[ds_name][:free_space] -= additional_space_required
        stores[ds_name][:disks].push(disk)

        stores = valid_placements(disk_configurations[1..-1], stores) if disk_configurations.length > 1
        combinations.push(stores)
      end
      combinations.flatten
    end

    def total_remaining_space(placement)
      total_space = 0
      placement.each do |ds_name, props|
        total_space += props[:free_space]
      end
      total_space
    end

    def deep_copy(o)
      Marshal.load(Marshal.dump(o))
    end
  end
end
