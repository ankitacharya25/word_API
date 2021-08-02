require "test_helper"

class ApikeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apikey = apikeys(:one)
  end

  test "should get index" do
    get apikeys_url
    assert_response :success
  end

  test "should get new" do
    get new_apikey_url
    assert_response :success
  end

  test "should create apikey" do
    assert_difference('Apikey.count') do
      post apikeys_url, params: { apikey: { api_key: @apikey.api_key, count: @apikey.count, user_id: @apikey.user_id } }
    end

    assert_redirected_to apikey_url(Apikey.last)
  end

  test "should show apikey" do
    get apikey_url(@apikey)
    assert_response :success
  end

  test "should get edit" do
    get edit_apikey_url(@apikey)
    assert_response :success
  end

  test "should update apikey" do
    patch apikey_url(@apikey), params: { apikey: { api_key: @apikey.api_key, count: @apikey.count, user_id: @apikey.user_id } }
    assert_redirected_to apikey_url(@apikey)
  end

  test "should destroy apikey" do
    assert_difference('Apikey.count', -1) do
      delete apikey_url(@apikey)
    end

    assert_redirected_to apikeys_url
  end
end
