require 'test_helper'

class EventCustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get event_customers_new_url
    assert_response :success
  end

  test "should get create" do
    get event_customers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get event_customers_destroy_url
    assert_response :success
  end

end
