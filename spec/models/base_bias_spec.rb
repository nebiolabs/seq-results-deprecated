require 'spec_helper'

describe BaseBias do
  it { should belong_to :read_group }
  it { should validate_presence_of(:read_position) }
  it { should validate_presence_of(:num_a) }
  it { should validate_presence_of(:num_c) }
  it { should validate_presence_of(:num_g) }
  it { should validate_presence_of(:num_t) }
  it { should validate_presence_of(:num_n) }
  it { should validate_presence_of(:num_x) }
end