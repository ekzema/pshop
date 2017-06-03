require 'test_helper'

class AdminpanelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adminpanel_index_url
    assert_response :success
  end

end
