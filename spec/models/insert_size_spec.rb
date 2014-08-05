require 'spec_helper'

describe InsertSize do
  it { should belong_to :read_group }
  it { should validate_presence_of(:insert_size) }
  it { should validate_presence_of(:fr_count) }
end