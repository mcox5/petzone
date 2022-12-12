require "test_helper"

class VaccinesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vaccines_new_url
    assert_response :success
  end

  test "should get create" do
    get vaccines_create_url
    assert_response :success
  end

  test "should get edit" do
    get vaccines_edit_url
    assert_response :success
  end

  test "should get update" do
    get vaccines_update_url
    assert_response :success
  end

  test "should get destroy" do
    get vaccines_destroy_url
    assert_response :success
  end
end
