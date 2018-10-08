require 'test_helper'

class InfoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get info_new_url
    assert_response :success
  end

end
