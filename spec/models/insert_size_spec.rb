require 'spec_helper'

describe InsertSize do
  it { should belong_to :read_group }
  it { should validate_presence_of(:rg_id) }
  it { should validate_presence_of(:insert_size) }
  it { should validate_presence_of(:fr_count) }

  context 'it has a composite key of rg_id and insert_size' do
    it 'should error when another insert_size with the same primary keys is create' do
      first_insert_size = create(:insert_size)
      count = InsertSize.count

      expect {
        create(:insert_size, rg_id: first_insert_size.rg_id, insert_size: first_insert_size.insert_size)
      }.to raise_error ActiveRecord::RecordInvalid

      expect(InsertSize.count).to eql(count)
    end

    it 'should not validate uniqueness of only rg_id' do
      first_insert_size = create(:insert_size)
      count = InsertSize.count

      expect {
        create(:insert_size, rg_id: first_insert_size.rg_id)
      }.to_not raise_error

      expect(InsertSize.count).to eql(count + 1)
    end

    it 'should not validate uniqueness of only insert_size' do
      first_insert_size = create(:insert_size)
      count = InsertSize.count

      expect {
        create(:insert_size, rg_id: first_insert_size.insert_size)
      }.to_not raise_error

      expect(InsertSize.count).to eql(count + 1)
    end
  end
end