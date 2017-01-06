require 'test_helper'

class RunGroupTest < ActiveSupport::TestCase
  def setup
    run = Run.new(name: 'run_1')
    @read_group = ReadGroup.new(run: run.id ,library: "test_library", barcode: "AGGATTAC", sample: "HG19")
  end

  test "run is valid" do
    assert @read_group.valid?

  end
end