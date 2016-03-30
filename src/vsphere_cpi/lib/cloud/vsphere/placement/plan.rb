module VSphereCloud
  module PlacementConstraint
    class Plan
      attr_reader :host_name, :cluster_name, :ephemeral_datastore_name, :persistent_datastore_name
    end
  end
end
