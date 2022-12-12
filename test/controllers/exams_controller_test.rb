require "test_helper"

class ExamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get exams_new_url
    assert_response :success
  end

  test "should get create" do
    get exams_create_url
    assert_response :success
  end

  test "should get show" do
    get exams_show_url
    assert_response :success
  end

  test "should get edit" do
    get exams_edit_url
    assert_response :success
  end

  test "should get update" do
    get exams_update_url
    assert_response :success
  end

  test "should get destroy" do
    get exams_destroy_url
    assert_response :success
  end
end
