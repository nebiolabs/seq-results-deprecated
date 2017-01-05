require 'test_helper'


class RunsControllerTest < ActionController::TestCase

  def setup
    @request.headers['Accept']= Mime::JSON
    @request.headers['Content-Type']= Mime::JSON.to_s
  end

  test "should create_a read_run" do
    params = {run:{name:"161209_M02896_0377_000000000-AV677",date:161225,instrument:"NS500355",instrument_type:"nextseq",read_1_size:76,index_read_2_size:8}}

    post :create, params, :format => "json"
    assert_response :success
  end

  test "should create_a read_run without anything except name" do
    params = {run:{name:"161209_M02896_0377_000000000-AV677"}}

    post :create, params, :format => "json"
    assert_response :success
  end

  test "should not create_a read_run without a name or anything else" do
    params = {run:{name:""}}

    post :create, params, :format => "json"
    assert_response(422)
  end

end