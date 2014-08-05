require 'spec_helper'

describe BedCoverage do
  it { should belong_to :read_group }
  it { should belong_to :bed_region }
end