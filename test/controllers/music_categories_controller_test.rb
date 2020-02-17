require 'test_helper'

class MusicCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @music_category = music_categories(:one)
  end

  test "should get index" do
    get music_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_music_category_url
    assert_response :success
  end

  test "should create music_category" do
    assert_difference('MusicCategory.count') do
      post music_categories_url, params: { music_category: { name: @music_category.name } }
    end

    assert_redirected_to music_category_url(MusicCategory.last)
  end

  test "should show music_category" do
    get music_category_url(@music_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_music_category_url(@music_category)
    assert_response :success
  end

  test "should update music_category" do
    patch music_category_url(@music_category), params: { music_category: { name: @music_category.name } }
    assert_redirected_to music_category_url(@music_category)
  end

  test "should destroy music_category" do
    assert_difference('MusicCategory.count', -1) do
      delete music_category_url(@music_category)
    end

    assert_redirected_to music_categories_url
  end
end
