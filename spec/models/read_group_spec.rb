require 'spec_helper'

describe ReadGroup do
  it { should belong_to :run }
  it { should have_many :gc_biases }
  it { should have_many :insert_sizes }
  it { should have_many :base_biases }
  it { should have_many :coverage_depths }
  it { should have_many :bed_coverages }

  it { should validate_presence_of(:library) }
  it { should validate_presence_of(:barcode) }
  it { should validate_presence_of(:sample) }
  it { should validate_presence_of(:project) }
end