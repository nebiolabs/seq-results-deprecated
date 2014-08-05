require 'spec_helper'

describe DuplicateRead do
  it { should belong_to :read_group }
  it { should validate_presence_of(:fold_reads) }
  it { should validate_presence_of(:fold_unique) }
end