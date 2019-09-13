require 'test_helper'

class SubTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sub_tags_new_url
    assert_response :success
  end

  test "should get create" do
    get sub_tags_create_url
    assert_response :success
  end

  test "should get index" do
    get sub_tags_index_url
    assert_response :success
  end

  test "should get delete" do
    get sub_tags_delete_url
    assert_response :success
  end

end
