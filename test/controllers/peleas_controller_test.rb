require 'test_helper'

class PeleasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get peleas_index_url
    assert_response :success
  end

end
