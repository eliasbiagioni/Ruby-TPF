require "application_system_test_case"

class CatalogCategoriesTest < ApplicationSystemTestCase
  setup do
    @catalog_category = catalog_categories(:one)
  end

  test "visiting the index" do
    visit catalog_categories_url
    assert_selector "h1", text: "Catalog Categories"
  end

  test "creating a Catalog category" do
    visit catalog_categories_url
    click_on "New Catalog Category"

    fill_in "Name", with: @catalog_category.name
    click_on "Create Catalog category"

    assert_text "Catalog category was successfully created"
    click_on "Back"
  end

  test "updating a Catalog category" do
    visit catalog_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @catalog_category.name
    click_on "Update Catalog category"

    assert_text "Catalog category was successfully updated"
    click_on "Back"
  end

  test "destroying a Catalog category" do
    visit catalog_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Catalog category was successfully destroyed"
  end
end
