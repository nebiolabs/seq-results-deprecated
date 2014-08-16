require 'spec_helper'

describe DuplicateRead do
  it { should belong_to :read_group }
  it { should validate_presence_of(:rg_id) }
  it { should validate_presence_of(:fold_reads) }
  it { should validate_presence_of(:fold_unique) }

  context 'it has a composite key of rg_id and fold_reads' do
    it 'should error when another duplicate_read with the same primary keys is create' do
      first_duplicate_read = create(:duplicate_read)
      count = DuplicateRead.count

      expect {
        create(
          :duplicate_read,
            rg_id: first_duplicate_read.rg_id,
            fold_reads: first_duplicate_read.fold_reads
        )
      }.to raise_error ActiveRecord::RecordInvalid

      expect(DuplicateRead.count).to eql(count)
    end
  end
end