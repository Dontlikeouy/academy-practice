require "test_helper"

class LabRepostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_repost = lab_reposts(:one)
  end

  test "should get index" do
    get lab_reposts_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_repost_url
    assert_response :success
  end

  test "should create lab_repost" do
    assert_difference("LabRepost.count") do
      post lab_reposts_url, params: { lab_repost: { description: @lab_repost.description, grade: @lab_repost.grade, title: @lab_repost.title } }
    end

    assert_redirected_to lab_repost_url(LabRepost.last)
  end

  test "should show lab_repost" do
    get lab_repost_url(@lab_repost)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_repost_url(@lab_repost)
    assert_response :success
  end

  test "should update lab_repost" do
    patch lab_repost_url(@lab_repost), params: { lab_repost: { description: @lab_repost.description, grade: @lab_repost.grade, title: @lab_repost.title } }
    assert_redirected_to lab_repost_url(@lab_repost)
  end

  test "should destroy lab_repost" do
    assert_difference("LabRepost.count", -1) do
      delete lab_repost_url(@lab_repost)
    end

    assert_redirected_to lab_reposts_url
  end
end
