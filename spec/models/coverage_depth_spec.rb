require 'spec_helper'

describe CoverageDepth do
  it { should belong_to :read_group }
  it { should validate_presence_of(:rg_id) }
  it { should validate_presence_of(:depth) }
  it { should validate_presence_of(:chromosome) }

  context 'it has a composite key of rg_id and depth and chromosome' do
    it 'should error when another coverage_depth with the same primary keys is create' do
      first_coverage_depth = create(:coverage_depth)
      count = CoverageDepth.count

      expect {
        create(
          :coverage_depth,
            rg_id: first_coverage_depth.rg_id,
            depth: first_coverage_depth.depth,
            chromosome: first_coverage_depth.chromosome
        )
      }.to raise_error ActiveRecord::RecordInvalid

      expect(CoverageDepth.count).to eql(count)
    end
  end
end