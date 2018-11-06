require 'test_helper'

class AcercaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get acerca_index_url
    assert_response :success
  end

end
