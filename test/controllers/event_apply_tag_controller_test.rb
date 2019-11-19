require 'test_helper'

class EventApplyTagControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get event_apply_tag_edit_url
    assert_response :success
  end

end
