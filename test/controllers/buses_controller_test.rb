require "test_helper"

class BusesControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get buses_start_url
    assert_response :success
  end

  test "should get book" do
    get buses_book_url
    assert_response :success
  end
end
