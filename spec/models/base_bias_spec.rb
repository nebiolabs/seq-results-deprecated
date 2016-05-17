require 'spec_helper'

describe BaseBias do
  it { should belong_to :read_group }
  it { should validate_presence_of(:rg_id) }
  it { should validate_presence_of(:read_position) }
  it { should validate_presence_of(:num_a) }
  it { should validate_presence_of(:num_c) }
  it { should validate_presence_of(:num_g) }
  it { should validate_presence_of(:num_t) }
  it { should validate_presence_of(:num_n) }
  it { should validate_presence_of(:num_x) }

  context 'it has a composite key of rg_id and read_position' do
    it 'should error when another base_bias with the same primary keys is created' do
      first_base_bias = create(:base_bias)
      count = BaseBias.count

      expect {
        create(:base_bias, rg_id: first_base_bias.rg_id, read_position: first_base_bias.read_position)
      }.to raise_error ActiveRecord::RecordInvalid

      expect(BaseBias.count).to eql(count)
    end

    it 'should not validate uniqueness of only rg_id' do
      first_base_bias = create(:base_bias)
      count = BaseBias.count

      expect {
        create(:base_bias, rg_id: first_base_bias.rg_id)
      }.to_not raise_error

      expect(BaseBias.count).to eql(count + 1)
    end

    it 'should not validate uniqueness of only read_position' do
      first_base_bias = create(:base_bias)
      count = BaseBias.count

      expect {
        create(:base_bias, read_position: first_base_bias.read_position)
      }.to_not raise_error

      expect(BaseBias.count).to eql(count + 1)
    end
  end
end