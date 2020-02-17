require 'test_helper'

class MovieCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_category = movie_categories(:one)
  end

  test "should get index" do
    get movie_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_category_url
    assert_response :success
  end

  test "should create movie_category" do
    assert_difference('MovieCategory.count') do
      post movie_categories_url, params: { movie_category: { name: @movie_category.name } }
    end

    assert_redirected_to movie_category_url(MovieCategory.last)
  end

  test "should show movie_category" do
    get movie_category_url(@movie_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_category_url(@movie_category)
    assert_response :success
  end

  test "should update movie_category" do
    patch movie_category_url(@movie_category), params: { movie_category: { name: @movie_category.name } }
    assert_redirected_to movie_category_url(@movie_category)
  end

  test "should destroy movie_category" do
    assert_difference('MovieCategory.count', -1) do
      delete movie_category_url(@movie_category)
    end

    assert_redirected_to movie_categories_url
  end
end
