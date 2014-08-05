require 'spec_helper'

describe Run do
  it { should have_many :read_groups }
  it { should validate_presence_of(:name) }
end