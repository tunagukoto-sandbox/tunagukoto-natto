require 'test_helper'

class MiniEventApplyTagControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get mini_event_apply_tag_update_url
    assert_response :success
  end

end
