require "test_helper"

class Publics::PostFavtimesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_post_favtimes_show_url
    assert_response :success
  end

  test "should get edit" do
    get publics_post_favtimes_edit_url
    assert_response :success
  end

  test "should get update" do
    get publics_post_favtimes_update_url
    assert_response :success
  end

  test "should get index" do
    get publics_post_favtimes_index_url
    assert_response :success
  end

  test "should get destroy" do
    get publics_post_favtimes_destroy_url
    assert_response :success
  end

  test "should get new" do
    get publics_post_favtimes_new_url
    assert_response :success
  end

  test "should get create" do
    get publics_post_favtimes_create_url
    assert_response :success
  end
end
