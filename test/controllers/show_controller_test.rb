require 'test_helper'

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get show_user_url
    assert_response :success
  end

end
