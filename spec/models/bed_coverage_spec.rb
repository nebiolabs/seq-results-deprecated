require 'spec_helper'

describe BedCoverage do
  it { should belong_to :read_group }
  it { should belong_to :bed_region }

  it { should validate_presence_of(:rg_id) }
  it { should validate_presence_of(:bed_id) }

  context 'it has a composite key of rg_id and bed_id' do
    it 'should error when another bed_coverage with the same primary keys is created' do
      first_bed_coverage = create(:bed_coverage)
      count = BedCoverage.count

      expect {
        create(:bed_coverage, rg_id: first_bed_coverage.rg_id, bed_id: first_bed_coverage .bed_id)
      }.to raise_error ActiveRecord::RecordInvalid

      expect(BedCoverage.count).to eql(count)
    end
  end
end