require 'spec_helper'

describe LibraryComplexity do
  it { should belong_to :read_group }
  it { should validate_presence_of(:rg_id) }
  it { should validate_presence_of(:unpaired_reads_examined) }
  it { should validate_presence_of(:read_pairs_examined) }
  it { should validate_presence_of(:unmapped_reads) }
  it { should validate_presence_of(:unpaired_read_duplicates) }
  it { should validate_presence_of(:read_pair_duplicates) }
  it { should validate_presence_of(:read_pair_optical_duplicates) }
  it { should validate_presence_of(:percent_duplication) }
  it { should validate_presence_of(:estimated_library_size) }
end