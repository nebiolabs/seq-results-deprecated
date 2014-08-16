require 'spec_helper'

describe AlignmentMetric do
  it { should belong_to :read_group }
  it { should validate_presence_of :category }
  it { should validate_presence_of :rg_id }

  context 'it has a composite key of rg_id and category' do
    it 'should error when another alignment_metric with the same primary keys is create' do
      first_alignment_metric = create(:alignment_metric)
      count = AlignmentMetric.count

      expect {
        create(
            :alignment_metric,
            rg_id: first_alignment_metric.rg_id,
            category: first_alignment_metric.category
        )
      }.to raise_error ActiveRecord::RecordInvalid

      expect(AlignmentMetric.count).to eql(count)
    end
  end
end