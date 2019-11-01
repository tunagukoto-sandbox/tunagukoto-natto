require 'test_helper'

class MiniEventCustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mini_event_customers_new_url
    assert_response :success
  end

  test "should get create" do
    get mini_event_customers_create_url
    assert_response :success
  end

  test "should get edit" do
    get mini_event_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get mini_event_customers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get mini_event_customers_destroy_url
    assert_response :success
  end

end
