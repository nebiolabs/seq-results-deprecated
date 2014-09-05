require 'spec_helper'

describe DuplicateGroup do
  it { should belong_to :read_group }
  it { should validate_presence_of(:rg_id) }
  it { should validate_presence_of(:duplication_group) }
  it { should validate_presence_of(:num_reads) }
end