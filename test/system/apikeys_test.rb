require "application_system_test_case"

class ApikeysTest < ApplicationSystemTestCase
  setup do
    @apikey = apikeys(:one)
  end

  test "visiting the index" do
    visit apikeys_url
    assert_selector "h1", text: "Apikeys"
  end

  test "creating a Apikey" do
    visit apikeys_url
    click_on "New Apikey"

    fill_in "Api key", with: @apikey.api_key
    fill_in "Count", with: @apikey.count
    fill_in "User", with: @apikey.user_id
    click_on "Create Apikey"

    assert_text "Apikey was successfully created"
    click_on "Back"
  end

  test "updating a Apikey" do
    visit apikeys_url
    click_on "Edit", match: :first

    fill_in "Api key", with: @apikey.api_key
    fill_in "Count", with: @apikey.count
    fill_in "User", with: @apikey.user_id
    click_on "Update Apikey"

    assert_text "Apikey was successfully updated"
    click_on "Back"
  end

  test "destroying a Apikey" do
    visit apikeys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Apikey was successfully destroyed"
  end
end
