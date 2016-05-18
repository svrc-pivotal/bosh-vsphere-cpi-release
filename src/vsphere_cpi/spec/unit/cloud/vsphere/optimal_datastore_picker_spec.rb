require 'spec_helper'

module VSphereCloud
  describe OptimalDatastorePicker do
    describe '#optimal_datastore_placements' do
      context 'when a single DS is available' do
        let(:available_datastores) do
          {
            'ds-1' => {
              free_space: 1024,
            },
          }
        end
        let(:disk1) do
          {
            size: 512,
            existing_datastore_name: 'ds-1',
            datastore_pattern: '^ds-1$',
          }
        end

        it 'returns the only valid placement' do
          picker = OptimalDatastorePicker.new(0)
          picker.update(available_datastores)

          disks = [disk1]
          expect(picker.optimal_datastore_placements(disks)).to eq([{
            'ds-1' => {
              free_space: 1024,
              disks: disks,
            }
          }])
        end
      end

      context 'when disks already live in the optimal datastore' do
        let(:available_datastores) do
          {
            'ds-1' => {
              free_space: 1024,
            },
            'ds-2' => {
              free_space: 2048,
            },
          }
        end

        let(:disk1) do
          {
            size: 512,
            existing_datastore_name: 'ds-1',
            datastore_pattern: 'ds\-.*',
          }
        end
        let(:disk2) do
          {
            size: 1024,
            existing_datastore_name: 'ds-1',
            datastore_pattern: 'ds\-.*',
          }
        end

        it 'places the disks in the original datastore to maximize remaining space' do
          picker = OptimalDatastorePicker.new(0)
          picker.update(available_datastores)
          disks = [disk1, disk2]

          expect(picker.optimal_datastore_placements(disks)).to match_array([
            {
              'ds-1' => {
                disks: a_collection_containing_exactly(disk1, disk2),
                free_space: 1024,
              },
              'ds-2' => {
                disks: [],
                free_space: 2048,
              }
            }
          ])
        end
      end

      context 'when some disks must be moved' do
        let(:available_datastores) do
          {
            'ds-1' => {
              free_space: 1024,
            },
            'ds-2' => {
              free_space: 2048,
            },
          }
        end

        let(:disk1) do
          {
            size: 512,
            existing_datastore_name: 'ds-2',
            datastore_pattern: '^ds\-1$',
          }
        end
        let(:disk2) do
          {
            size: 1024,
            existing_datastore_name: 'non-accessible-ds',
            datastore_pattern: 'ds\-.*',
          }
        end
        let(:disk3) do
          {
            size: 1024,
            existing_datastore_name: 'ds-2',
            datastore_pattern: 'ds\-.*',
          }
        end

        it 'places the disks to maximize remaining space' do
          picker = OptimalDatastorePicker.new(0)
          picker.update(available_datastores)
          disks = [disk1, disk2, disk3]

          expect(picker.optimal_datastore_placements(disks)).to match_array([
            {
              'ds-1' => {
                disks: a_collection_containing_exactly(disk1),
                free_space: 512,
              },
              'ds-2' => {
                disks: a_collection_containing_exactly(disk2, disk3),
                free_space: 1024,
              }
            },
          ])
        end
      end

      context 'when multiple optimal placement options exist' do
        let(:available_datastores) do
          {
            'ds-1' => {
              free_space: 1024,
            },
            'ds-2' => {
              free_space: 2048,
            },
          }
        end

        let(:disk1) do
          {
            size: 512,
            datastore_pattern: 'ds\-.*',
          }
        end
        let(:disk2) do
          {
            size: 1024,
            existing_datastore_name: 'non-accessible-ds',
            datastore_pattern: 'ds\-.*',
          }
        end

        it 'returns all optimal options' do
          picker = OptimalDatastorePicker.new(0)
          picker.update(available_datastores)
          disks = [disk1, disk2]

          expect(picker.optimal_datastore_placements(disks)).to match_array([
            {
              'ds-1' => {
                disks: a_collection_containing_exactly(disk1),
                free_space: 512,
              },
              'ds-2' => {
                disks: a_collection_containing_exactly(disk2),
                free_space: 1024,
              }
            },
            {
              'ds-1' => {
                disks: a_collection_containing_exactly(disk2),
                free_space: 0,
              },
              'ds-2' => {
                disks: a_collection_containing_exactly(disk1),
                free_space: 1536,
              }
            },
            {
              'ds-1' => {
                disks: [],
                free_space: 1024,
              },
              'ds-2' => {
                disks: a_collection_containing_exactly(disk1, disk2),
                free_space: 512,
              }
            }
          ])
        end
      end

      context 'when disks have a specific datastore' do
        let(:available_datastores) do
          {
            'ds-1' => {
              free_space: 1024,
            },
            'ds-2' => {
              free_space: 2048,
            },
          }
        end
        let(:disk1) do
          {
            size: 512,
            datastore_pattern: '^ds\-.*$',
          }
        end
        let(:disk2) do
          {
            size: 1024,
            datastore_pattern: '^ds-1$',
          }
        end

        it 'returns one combination for each datastore' do
          picker = OptimalDatastorePicker.new(0)
          picker.update(available_datastores)
          disks = [disk1, disk2]

          expect(picker.optimal_datastore_placements(disks)).to match_array([
            {
              'ds-1' => {
                disks: a_collection_containing_exactly(disk2),
                free_space: 0,
              },
              'ds-2' => {
              disks: a_collection_containing_exactly(disk1),
                free_space: 1536,
              },
            },
          ])
        end

        context 'when there are no valid placement options' do
          let(:disk1) do
            {
              size: 512,
              datastore_pattern: '^ds-1$',
            }
          end
          let(:disk2) do
            {
              size: 1024,
              datastore_pattern: '^no\-matching\-ds$',
            }
          end

          it 'returns an empty array' do
            picker = OptimalDatastorePicker.new(0)
            picker.update(available_datastores)
            disks = [disk1, disk2]

            expect(picker.optimal_datastore_placements(disks)).to match_array([])
          end
        end

        context 'when headroom is not 0' do
          let(:available_datastores) do
            {
              'ds-1' => {
                free_space: 4048,
              },
            }
          end
          let(:disk1) do
            {
              size: 1000,
              datastore_pattern: '.*',
            }
          end
          let(:disk2) do
            {
              size: 1000,
              datastore_pattern: '.*',
            }
          end

          it 'includes the default value in the calculation' do
            picker = OptimalDatastorePicker.new
            picker.update(available_datastores)
            disks = [disk1, disk2]

            expect(picker.optimal_datastore_placements(disks)).to match_array([
              {
                'ds-1' => {
                  disks: a_collection_containing_exactly(disk1, disk2),
                  free_space: 0,
                },
              },
            ])
          end
          it 'includes the specified headroom in the calculation' do
            available_datastores['ds-1'][:free_space] = 4000
            picker = OptimalDatastorePicker.new(1000)
            picker.update(available_datastores)
            disks = [disk1, disk2]

            expect(picker.optimal_datastore_placements(disks)).to match_array([
              {
                'ds-1' => {
                  disks: a_collection_containing_exactly(disk1, disk2),
                  free_space: 0,
                },
              },
            ])
          end
        end

        xit 'runs very slowly if inputs are large' do
          datastores = {}
          disks = []
          128.times do |n|
            datastores["ds-#{n}"] = { free_space: 10000 }
          end
          2.times do |n|
            disks.push({ size: 1, datastore_pattern: '.*'} )
          end
          picker = OptimalDatastorePicker.new(0)
          picker.update(datastores)
          now = Time.now
          picker.optimal_datastore_placements(disks)
          puts Time.now - now
        end
      end
    end
  end
end
