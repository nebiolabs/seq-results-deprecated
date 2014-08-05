require 'spec_helper'

describe AlignmentMetric do
  it { should belong_to :read_group }
  it { should validate_presence_of :category }
end