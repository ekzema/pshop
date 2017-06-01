require 'test_helper'

class TwocategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twocategory = twocategories(:one)
  end

  test "should get index" do
    get twocategories_url
    assert_response :success
  end

  test "should get new" do
    get new_twocategory_url
    assert_response :success
  end

  test "should create twocategory" do
    assert_difference('Twocategory.count') do
      post twocategories_url, params: { twocategory: { category_id: @twocategory.category_id, meta_desc: @twocategory.meta_desc, meta_key: @twocategory.meta_key, name: @twocategory.name } }
    end

    assert_redirected_to twocategory_url(Twocategory.last)
  end

  test "should show twocategory" do
    get twocategory_url(@twocategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_twocategory_url(@twocategory)
    assert_response :success
  end

  test "should update twocategory" do
    patch twocategory_url(@twocategory), params: { twocategory: { category_id: @twocategory.category_id, meta_desc: @twocategory.meta_desc, meta_key: @twocategory.meta_key, name: @twocategory.name } }
    assert_redirected_to twocategory_url(@twocategory)
  end

  test "should destroy twocategory" do
    assert_difference('Twocategory.count', -1) do
      delete twocategory_url(@twocategory)
    end

    assert_redirected_to twocategories_url
  end
end
