require 'test_helper'

class StudentPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_page_index_url
    assert_response :success
  end

  test "should get show" do
    get student_page_show_url
    assert_response :success
  end

end
