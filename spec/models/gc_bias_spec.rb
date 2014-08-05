require 'spec_helper'

describe GcBias do
  it { should belong_to :read_group }
  it { should validate_presence_of(:pct_gc) }
  it { should validate_presence_of(:num_reads) }
  it { should validate_presence_of(:num_windows) }
  it { should validate_presence_of(:mean_base_quality) }
  it { should validate_presence_of(:normalized_coverage) }
  it { should validate_presence_of(:error_bar_width) }
end