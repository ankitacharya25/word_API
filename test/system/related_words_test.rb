require "application_system_test_case"

class RelatedWordsTest < ApplicationSystemTestCase
  setup do
    @related_word = related_words(:one)
  end

  test "visiting the index" do
    visit related_words_url
    assert_selector "h1", text: "Related Words"
  end

  test "creating a Related word" do
    visit related_words_url
    click_on "New Related Word"

    fill_in "Related word", with: @related_word.related_word
    fill_in "Word", with: @related_word.word_id
    click_on "Create Related word"

    assert_text "Related word was successfully created"
    click_on "Back"
  end

  test "updating a Related word" do
    visit related_words_url
    click_on "Edit", match: :first

    fill_in "Related word", with: @related_word.related_word
    fill_in "Word", with: @related_word.word_id
    click_on "Update Related word"

    assert_text "Related word was successfully updated"
    click_on "Back"
  end

  test "destroying a Related word" do
    visit related_words_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Related word was successfully destroyed"
  end
end
