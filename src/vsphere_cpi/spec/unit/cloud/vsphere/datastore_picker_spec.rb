require 'spec_helper'

module VSphereCloud
  describe DatastorePicker do
    let(:available_datastores) do
      {
        "datastore-1" => 51200,
        "datastore-2" => 10240,
        "datastore-3" => 20480,
        "filtered-ds" => 10240
      }
    end

    describe '#best_disk_placement' do

      context 'when a single DS is available' do
        let(:available_datastores) do
         {
           'ds-1' => {
             free_space: 1024,
           },
         }
        end
        let(:already_placed_disk) do
          {
            size: 256,
            existing_datastore_name: 'ds-1',
            target_datastore_pattern: '.*',
          }
        end
        let(:moved_disk) do
          {
            size: 512,
            target_datastore_pattern: '.*',
          }
        end

        it 'returns the only valid placement' do
          picker = DatastorePicker.new(0)
          picker.update(available_datastores)
          disks = [already_placed_disk, moved_disk]

          expect(picker.best_disk_placement(disks)).to include({
            datastores: {
              'ds-1' => {
                free_space: 1024 - 512,
                disks: disks,
              }
            }
          })
        end

        context 'when no valid placement exists' do
          let(:large_disk) do
            {
              size: 999999,
              target_datastore_pattern: '.*',
            }
          end

          it 'raises an error' do
            picker = DatastorePicker.new(0)
            picker.update(available_datastores)
            disks = [large_disk]

            expect{
              picker.best_disk_placement(disks)
            }.to raise_error Bosh::Clouds::CloudError, /No valid placement/
          end
        end
      end

      context 'when a multiple DS are available' do
        let(:available_datastores) do
         {
           'ds-1' => {
             free_space: 512,
           },
           'ds-2' => {
             free_space: 1024,
           },
         }
        end
        let(:disk1) do
          {
            size: 256,
            target_datastore_pattern: 'ds-2',
          }
        end
        let(:disk2) do
          {
            size: 512,
            target_datastore_pattern: '.*',
          }
        end

        it 'places the disks into the datastores' do
          picker = DatastorePicker.new(0)
          picker.update(available_datastores)

          disks = [disk1, disk2]
          expect(picker.best_disk_placement(disks)).to include({
            datastores: {
              'ds-1' => {
                free_space: 0,
                disks: [disk2],
              },
              'ds-2' => {
                free_space: 768,
                disks: [disk1],
              },
            }
          })
        end

        context 'when given existing_datastore_name' do
          let(:disk1) do
            {
              size: 256,
              existing_datastore_name: 'ds-2',
              target_datastore_pattern: '.*',
            }
          end
          let(:disk2) do
            {
              size: 512,
              target_datastore_pattern: '.*',
            }
          end

          it 'keeps the disk in its existing datastore to minimize disk migrations' do
            picker = DatastorePicker.new(0)
            picker.update(available_datastores)

            disks = [disk1, disk2]
            expect(picker.best_disk_placement(disks)).to include({
              datastores: {
                'ds-1' => {
                  free_space: 0,
                  disks: [disk2],
                },
                'ds-2' => {
                  free_space: 1024,
                  disks: [disk1],
                },
              }
            })
          end
        end

        context 'when given existing_datastore_name that is not available' do
          let(:disk1) do
            {
              size: 256,
              existing_datastore_name: 'non-accessible-ds',
              target_datastore_pattern: '.*',
            }
          end
          let(:disk2) do
            {
              size: 512,
              target_datastore_pattern: '.*',
            }
          end

          it 'places the disk in an available datastore and includes the migration size' do
            picker = DatastorePicker.new(0)
            picker.update(available_datastores)

            disks = [disk1, disk2]

            expect(picker.best_disk_placement(disks)).to include({
              migration_size: 256,
              datastores: {
                'ds-1' => {
                  disks: [disk1],
                  free_space: 256,
                },
                'ds-2' => {
                  disks: [disk2],
                  free_space: 512,
                },
              },
            })
          end
        end

        describe ':balance_score' do
          it 'is calculated from (min + mean + median) free disk space, to balance things nicely' do
            [
              { datastore_space: [5,    5,    5],   balance_score: 15 },
              { datastore_space: [2000, 1,    1],   balance_score: 669 },
              { datastore_space: [100,  1000, 200], balance_score: 733 },
              { datastore_space: [500,  500,  400], balance_score: 1366 },
              { datastore_space: [700,  700],       balance_score: 2100 },
            ].each do |input|
              available_datastores = input[:datastore_space].each_with_index.map do |free_space, index|
                [ "ds-#{index}", { free_space: free_space } ]
              end.to_h

              picker = DatastorePicker.new(0)
              picker.update(available_datastores)

              expect(picker.best_disk_placement([])[:balance_score]).to eq(input[:balance_score])
            end
          end
        end
      end
    end

    describe '#pick_datastore_for_single_disk' do
      let(:available_datastores) do
       {
         'smaller-ds' => {
           free_space: 256,
         },
         'larger-ds' => {
           free_space: 1024,
         },
       }
      end
      let(:disk) do
        {
          size: 512,
          target_datastore_pattern: '.*',
        }
      end

      it 'returns the picked datastore name' do
        picker = DatastorePicker.new(0)
        picker.update(available_datastores)

        expect(picker.pick_datastore_for_single_disk(disk)).to eq('larger-ds')
      end
    end
  end
end
