require 'test_helper'

class MiniEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mini_events_new_url
    assert_response :success
  end

  test "should get create" do
    get mini_events_create_url
    assert_response :success
  end

  test "should get edit" do
    get mini_events_edit_url
    assert_response :success
  end

  test "should get update" do
    get mini_events_update_url
    assert_response :success
  end

  test "should get index" do
    get mini_events_index_url
    assert_response :success
  end

  test "should get show" do
    get mini_events_show_url
    assert_response :success
  end

  test "should get destroy" do
    get mini_events_destroy_url
    assert_response :success
  end

end
