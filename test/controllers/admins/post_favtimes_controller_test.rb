require "test_helper"

class Admins::PostFavtimesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admins_post_favtimes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_post_favtimes_update_url
    assert_response :success
  end

  test "should get index" do
    get admins_post_favtimes_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_post_favtimes_show_url
    assert_response :success
  end
end
