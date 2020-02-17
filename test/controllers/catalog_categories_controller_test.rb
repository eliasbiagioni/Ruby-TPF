require 'test_helper'

class CatalogCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catalog_category = catalog_categories(:one)
  end

  test "should get index" do
    get catalog_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_catalog_category_url
    assert_response :success
  end

  test "should create catalog_category" do
    assert_difference('CatalogCategory.count') do
      post catalog_categories_url, params: { catalog_category: { name: @catalog_category.name } }
    end

    assert_redirected_to catalog_category_url(CatalogCategory.last)
  end

  test "should show catalog_category" do
    get catalog_category_url(@catalog_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_catalog_category_url(@catalog_category)
    assert_response :success
  end

  test "should update catalog_category" do
    patch catalog_category_url(@catalog_category), params: { catalog_category: { name: @catalog_category.name } }
    assert_redirected_to catalog_category_url(@catalog_category)
  end

  test "should destroy catalog_category" do
    assert_difference('CatalogCategory.count', -1) do
      delete catalog_category_url(@catalog_category)
    end

    assert_redirected_to catalog_categories_url
  end
end
