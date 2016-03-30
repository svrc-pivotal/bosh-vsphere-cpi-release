module VSphereCloud
  module Resources
    class Host
      stringify_with :name

      # @!attribute mob
      #   @return [Vim::HostSystem] host system vSphere MOB.
      attr_reader :mob

      def initialize(datacenter, cluster, mob)
        @datacenter = datacenter
        @cluster = cluster
        @mob = mob
      end

      def name
        mob.name
      end

      def accessible_datastores

      end
      
    end
  end
end
