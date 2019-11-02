require 'test_helper'

class StudentStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get student_statuses_update_url
    assert_response :success
  end

  test "should get edit" do
    get student_statuses_edit_url
    assert_response :success
  end

end
