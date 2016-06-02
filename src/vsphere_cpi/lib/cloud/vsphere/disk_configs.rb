module VSphereCloud
  class DiskConfigs

    def initialize(opts)
      @datacenter = opts[:datacenter]
      @resource_pool = opts[:resource_pool]
      @disk_pool = opts[:disk_pool]
    end

    def find_persistent_disk(disk_cid)
      clean_cid, metadata = DiskMetadata.decode(disk_cid)

      disk = @datacenter.find_disk(clean_cid)
      return {
        cid: disk.cid,
        size: disk.size_in_mb,
        existing_datastore_name: disk.datastore.name,
        target_datastore_pattern: target_pattern_from_metadata(metadata),
      }
    end

    def new_ephemeral_disk
      return {
        size: @resource_pool['disk'],
        ephemeral: true,
        target_datastore_pattern: target_ephemeral_pattern,
      }
    end

    def new_persistent_disk(size)
      return {
        size: size,
        target_datastore_pattern: target_persistent_pattern,
      }
    end

    private

    def target_pattern_from_metadata(metadata)
      metadata[:target_datastore_pattern] || @datacenter.persistent_pattern
    end

    def target_ephemeral_pattern
      if @resource_pool['datastores'] && !@resource_pool['datastores'].empty?
        escaped_names = @resource_pool['datastores'].map { |pattern| Regexp.escape(pattern) }
        "^(#{escaped_names.join('|')})$"
      else
        @datacenter.ephemeral_pattern
      end
    end

    def target_persistent_pattern
      if @disk_pool['datastores'] && !@disk_pool['datastores'].empty?
        escaped_names = @disk_pool['datastores'].map { |pattern| Regexp.escape(pattern) }
        "^(#{escaped_names.join('|')})$"
      else
        @datacenter.persistent_pattern
      end
    end
  end
end
