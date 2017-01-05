require 'test_helper'


class ReadGroupsControllerTest < ActionController::TestCase

  def setup
    @request.headers['Accept']= Mime::JSON
    @request.headers['Content-Type']= Mime::JSON.to_s
  end

  test "should create_a read_group" do
    params = {read_group:{run_id:5,library:"25ng_Directional_UHR_U2_p10",barcode:"CGTATCTC",sample:"hg19",genome_id:1,properties:{i7_index_id:"P10-A10",index:"CGTATCTC",description:"yigit@neb.com",sample_number:1}}}

    post :create, params, :format => "json"
    assert_response :success
  end

  test "should create read_group without properties" do
    params = {read_group:{run_id:5,library:"25ng_Directional_UHR_U2_p10",barcode:"CGTATCTC",sample:"hg19",genome_id:1,properties:{}}}

    post :create, params, :format => "json"
    assert_response :success
  end

  test "should create read_group with many properties" do
    params = {read_group:{run_id:5,library:"25ng_Directional_UHR_U2_p10",barcode:"CGTATCTC",sample:"hg19",genome_id:1,properties:{three_flanking_region:'nil', annealing_temp:66, antisense:'+', binding_site:'6p21.3', endonuclease:'FEN1',flanking_region:'nil', temp:66, sense:'+', site:'6p21.3', nuclease:'FEN1',three_flanking:'nil', annealing:66, antise:'+', annealing_site:'6p21.3', end:'FEN1'}}}

    post :create, params, :format => "json"
    assert_response :success
  end

  test "should create read_group with floats" do
    params = {read_group:{run_id:5,library:"25ng_Directional_UHR_U2_p10",barcode:"CGTATCTC",sample:"hg19",genome_id:1,properties:{three_flanking_region:'nil', annealing_temp:66.2, antisense:'+', binding_site:'6p21.3', endonuclease:'FEN1',flanking_region:'nil', temp:66, sense:'+', site:'6p21.3', nuclease:'FEN1',three_flanking:'nil', annealing:66, antise:'+', annealing_site:'6p21.3', end:'FEN1'}}}

    post :create, params, :format => "json"
    assert_response :success
  end

  test "should not create read_group with nil attributes" do
    params = {read_group:{run_id:5,library:nil,barcode:nil,sample:nil,genome_id:1,properties:{}}}

    post :create, params, :format => "json"
    assert_response(422)
  end

  test "should handle with number prefixed attribute name" do
    params = '{"read_group":{"run_id":5,"library":"25ng_Directional_UHR_U2_p10","barcode":"CGTATCTC","sample":"hg19","genome_id":1,"properties":{"1description":"zulch@neb.com"}}}'

    post :create, JSON.parse(params), :format => "json"
    assert_response :success
  end

  test "should handle spaces in fields" do
    params = '{"read_group":{"run_id":5,"library":"25ng_Directi onal_UHR_U2_p10","barcode":"CGTATCTC","sample":"hg19","genome_id":1,"properties":{"description email":"zulch @neb.com"}}}'

    post :create, JSON.parse(params), :format => "json"
    assert_response :success
  end

  test "should handle - in fields" do
    params = '{"read_group":{"run_id":5,"library":"25ng_Directi-onal_UHR_U2_p10","barcode":"CGTATCTC","sample":"hg19","genome_id":1,"properties":{"description-email":"zulch-@neb.com"}}}'

    post :create, JSON.parse(params), :format => "json"
    assert_response :success
  end

  test "should handle / in fields" do
    params = '{"read_group":{"run_id":5,"library":"25ng_Directi/onal_UHR_U2_p10","barcode":"CGTATCTC","sample":"hg19","genome_id":1,"properties":{"description/email":"zulch/@neb.com"}}}'

    post :create, JSON.parse(params), :format => "json"
    assert_response :success
  end

  test "should handle , in fields" do
    params = '{"read_group":{"run_id":5,"library":"25ng_Direction,al_UHR_U2_p10","barcode":"CGTATCTC","sample":"hg19","genome_id":1,"properties":{"description,email":"zulch,@neb.com"}}}'

    post :create, JSON.parse(params), :format => "json"
    assert_response :success
  end

  test "should handle @ in fields" do
    params = '{"read_group":{"run_id":5,"library":"25ng_Direction@al_UHR_U2_p10","barcode":"CGTATCTC","sample":"hg19","genome_id":1,"properties":{"@description_email":"zulch@neb.com"}}}'

    post :create, JSON.parse(params), :format => "json"
    assert_response :success
  end

  test "should handle : in fields" do
    params = '{"read_group":{"run_id":5,"library":"25ng_Direct:ional_UHR_U2_p10","barcode":"CGTATCTC","sample":"hg19","genome_id":1,"properties":{":description_email":":zulch@neb.com"}}}'

    post :create, JSON.parse(params), :format => "json"
    assert_response :success
  end

end