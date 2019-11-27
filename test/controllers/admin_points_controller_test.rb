require 'test_helper'

class AdminPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_points_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_points_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_points_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_points_update_url
    assert_response :success
  end

end
