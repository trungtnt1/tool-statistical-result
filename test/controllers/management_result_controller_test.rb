require "test_helper"

class ManagementResultControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get management_result_index_url
    assert_response :success
  end
end
