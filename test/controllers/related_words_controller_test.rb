require "test_helper"

class RelatedWordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @related_word = related_words(:one)
  end

  test "should get index" do
    get related_words_url
    assert_response :success
  end

  test "should get new" do
    get new_related_word_url
    assert_response :success
  end

  test "should create related_word" do
    assert_difference('RelatedWord.count') do
      post related_words_url, params: { related_word: { related_word: @related_word.related_word, word_id: @related_word.word_id } }
    end

    assert_redirected_to related_word_url(RelatedWord.last)
  end

  test "should show related_word" do
    get related_word_url(@related_word)
    assert_response :success
  end

  test "should get edit" do
    get edit_related_word_url(@related_word)
    assert_response :success
  end

  test "should update related_word" do
    patch related_word_url(@related_word), params: { related_word: { related_word: @related_word.related_word, word_id: @related_word.word_id } }
    assert_redirected_to related_word_url(@related_word)
  end

  test "should destroy related_word" do
    assert_difference('RelatedWord.count', -1) do
      delete related_word_url(@related_word)
    end

    assert_redirected_to related_words_url
  end
end
