require "test_helper"

class Publics::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get publics_homes_top_url
    assert_response :success
  end
end
