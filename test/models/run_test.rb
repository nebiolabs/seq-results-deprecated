require 'test_helper'

class RunTest < ActiveSupport::TestCase
  def setup
    @run = Run.new(name: 'run_1')
  end

  test "run is valid" do
    assert @run.valid?
  end

  test "name should be present" do
    @run.name = " "
    assert_not @run.valid?
  end

end