require "application_system_test_case"

class LabRepostsTest < ApplicationSystemTestCase
  setup do
    @lab_repost = lab_reposts(:one)
  end

  test "visiting the index" do
    visit lab_reposts_url
    assert_selector "h1", text: "Lab reposts"
  end

  test "should create lab repost" do
    visit lab_reposts_url
    click_on "New lab repost"

    fill_in "Description", with: @lab_repost.description
    fill_in "Grade", with: @lab_repost.grade
    fill_in "Title", with: @lab_repost.title
    click_on "Create Lab repost"

    assert_text "Lab repost was successfully created"
    click_on "Back"
  end

  test "should update Lab repost" do
    visit lab_repost_url(@lab_repost)
    click_on "Edit this lab repost", match: :first

    fill_in "Description", with: @lab_repost.description
    fill_in "Grade", with: @lab_repost.grade
    fill_in "Title", with: @lab_repost.title
    click_on "Update Lab repost"

    assert_text "Lab repost was successfully updated"
    click_on "Back"
  end

  test "should destroy Lab repost" do
    visit lab_repost_url(@lab_repost)
    click_on "Destroy this lab repost", match: :first

    assert_text "Lab repost was successfully destroyed"
  end
end
