require "application_system_test_case"

class UsrsTest < ApplicationSystemTestCase
  setup do
    @usr = usrs(:one)
  end

  test "visiting the index" do
    visit usrs_url
    assert_selector "h1", text: "Usrs"
  end

  test "should create usr" do
    visit usrs_url
    click_on "New usr"

    fill_in "Password", with: @usr.password
    fill_in "Usrname", with: @usr.usrname
    click_on "Create Usr"

    assert_text "Usr was successfully created"
    click_on "Back"
  end

  test "should update Usr" do
    visit usr_url(@usr)
    click_on "Edit this usr", match: :first

    fill_in "Password", with: @usr.password
    fill_in "Usrname", with: @usr.usrname
    click_on "Update Usr"

    assert_text "Usr was successfully updated"
    click_on "Back"
  end

  test "should destroy Usr" do
    visit usr_url(@usr)
    click_on "Destroy this usr", match: :first

    assert_text "Usr was successfully destroyed"
  end
end
