require 'test_helper'

class CompanyPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_page_index_url
    assert_response :success
  end

  test "should get show" do
    get company_page_show_url
    assert_response :success
  end

end
