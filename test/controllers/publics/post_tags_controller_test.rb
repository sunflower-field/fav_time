require "test_helper"

class Publics::PostTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get publics_post_tags_destroy_url
    assert_response :success
  end

  test "should get index" do
    get publics_post_tags_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_post_tags_show_url
    assert_response :success
  end
end
