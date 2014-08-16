require 'spec_helper'

describe GcBias do
  it { should belong_to :read_group }
  it { should validate_presence_of(:rg_id) }
  it { should validate_presence_of(:pct_gc) }
  it { should validate_presence_of(:num_reads) }
  it { should validate_presence_of(:num_windows) }
  it { should validate_presence_of(:mean_base_quality) }
  it { should validate_presence_of(:normalized_coverage) }
  it { should validate_presence_of(:error_bar_width) }

  context 'it has a composite key of rg_id and pct_gc' do
    it 'should error when another gc_bias with the same primary keys is create' do
      first_gc_bias = create(:gc_bias)
      count = GcBias.count

      expect {
        create(:gc_bias, rg_id: first_gc_bias.rg_id, pct_gc: first_gc_bias.pct_gc)
      }.to raise_error ActiveRecord::RecordInvalid

      expect(GcBias.count).to eql(count)
    end

    it 'should not validate uniqueness of only rg_id' do
      first_gc_bias = create(:gc_bias)
      count = GcBias.count

      expect {
        create(:gc_bias, rg_id: first_gc_bias.rg_id)
      }.to_not raise_error

      expect(GcBias.count).to eql(count +1)
    end

    it 'should not validate uniqueness of only pct_gc' do
      first_gc_bias = create(:gc_bias)
      count = GcBias.count

      expect {
        create(:gc_bias, pct_gc: first_gc_bias.pct_gc)
      }.to_not raise_error

      expect(GcBias.count).to eql(count +1)
    end
  end
end