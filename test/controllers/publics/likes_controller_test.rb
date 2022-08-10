require "test_helper"

class Publics::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get publics_likes_destroy_url
    assert_response :success
  end

  test "should get create" do
    get publics_likes_create_url
    assert_response :success
  end
end
