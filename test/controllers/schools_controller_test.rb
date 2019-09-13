require 'test_helper'

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get schools_new_url
    assert_response :success
  end

  test "should get create" do
    get schools_create_url
    assert_response :success
  end

  test "should get index" do
    get schools_index_url
    assert_response :success
  end

  test "should get delete" do
    get schools_delete_url
    assert_response :success
  end

end
