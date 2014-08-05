require 'spec_helper'

describe CoverageDepth do
  it { should belong_to :read_group }
  it { should validate_presence_of(:depth) }
  it { should validate_presence_of(:chromosome) }
end