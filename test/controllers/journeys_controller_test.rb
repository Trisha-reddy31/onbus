require "test_helper"

class JourneysControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get journeys_start_url
    assert_response :success
  end

  test "should get select_seat" do
    get journeys_select_seat_url
    assert_response :success
  end

  test "should get booking_confirmation" do
    get journeys_booking_confirmation_url
    assert_response :success
  end
end
