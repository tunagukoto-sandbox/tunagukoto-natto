require 'test_helper'

class MiniQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get mini_questions_create_url
    assert_response :success
  end

end
