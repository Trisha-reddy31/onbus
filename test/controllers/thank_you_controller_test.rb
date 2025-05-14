require "test_helper"

class ThankYouControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get thank_you_index_url
    assert_response :success
  end
end
