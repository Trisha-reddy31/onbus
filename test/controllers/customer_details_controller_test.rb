require "test_helper"

class CustomerDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_details_new_url
    assert_response :success
  end

  test "should get create" do
    get customer_details_create_url
    assert_response :success
  end
end
