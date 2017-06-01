require 'test_helper'

class ProductSlideImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get product_slide_images_create_url
    assert_response :success
  end

end
