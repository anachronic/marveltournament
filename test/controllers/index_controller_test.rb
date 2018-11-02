require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get index_hello_url
    assert_response :success
  end

end
