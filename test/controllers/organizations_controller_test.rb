require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get student_group" do
    get organizations_student_group_url
    assert_response :success
  end

  test "should get non_profit" do
    get organizations_non_profit_url
    assert_response :success
  end

end
