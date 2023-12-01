require "test_helper"

class GitUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get git_user_index_url
    assert_response :success
  end
end
