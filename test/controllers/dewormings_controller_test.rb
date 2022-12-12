require "test_helper"

class DewormingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dewormings_new_url
    assert_response :success
  end

  test "should get create" do
    get dewormings_create_url
    assert_response :success
  end

  test "should get edit" do
    get dewormings_edit_url
    assert_response :success
  end

  test "should get update" do
    get dewormings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dewormings_destroy_url
    assert_response :success
  end
end
