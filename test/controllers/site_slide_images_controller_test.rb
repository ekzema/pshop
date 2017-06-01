require 'test_helper'

class SiteSlideImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get site_slide_images_create_url
    assert_response :success
  end

end
