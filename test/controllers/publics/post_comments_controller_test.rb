require "test_helper"

class Publics::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get publics_post_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get publics_post_comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get publics_post_comments_destroy_url
    assert_response :success
  end

  test "should get create" do
    get publics_post_comments_create_url
    assert_response :success
  end

  test "should get new" do
    get publics_post_comments_new_url
    assert_response :success
  end
end
