require 'spec_helper'

module VSphereCloud
  describe Placement::Planner do
    subject(:planner) { Placement::Planner.new(datacenter) }

    let(:datacenter) do
      instance_double(Resources::Datacenter,
        ephemeral_datastores: ephemeral_datastores,
        persistent_datastores: persistent_datastores,
      )
    end

    let(:configurations) do
      [
        {
          ephemeral_datastores: [
            instance_double(Resources::Datastore, name: "Local1"),
            instance_double(Resources::Datastore, name: "Shared")
          ],
          persistent_datastores: [
            instance_double(Resources::Datastore, name: "Local2"),
            instance_double(Resources::Datastore, name: "Shared")
          ],
          accepted_possibilities: [
            { host: "Host1", ephemeral: "Local1", persistent: "Shared" },
            { host: "Host1", ephemeral: "Shared", persistent: "Shared" },
            { host: "Host2", ephemeral: "Shared", persistent: "Shared" },
            { host: "Host2", ephemeral: "Shared", persistent: "Local2" }
          ]
        }
      ]
    end

    describe "#plan_placement" do
      context "without existing vms or persistent disks" do
        configurations.each do |config|
          let(:ephemeral_datastores) { config.ephemeral_datastores }
          let(:persistent_datastores) { config.persistent_datastores }
          it "returns a possible placement plan" do
            placement_plan = planner.plan_placement(nil, nil)
            plan = {
              host: placement_plan.host,
              ephemeral: placement_plan.ephemeral_datastore,
              persistent: placement_plan.persistent_datastore,
            }
            expect(config.accepted_possibilities.any? { |possibility| possibility == plan }).to eq(true)
          end
        end
      end

    end

    describe "#plan_disk_placement" do
      it "returns a possible disk placement plan" do

      end
    end
  end
end
