require "application_system_test_case"

class MovieCategoriesTest < ApplicationSystemTestCase
  setup do
    @movie_category = movie_categories(:one)
  end

  test "visiting the index" do
    visit movie_categories_url
    assert_selector "h1", text: "Movie Categories"
  end

  test "creating a Movie category" do
    visit movie_categories_url
    click_on "New Movie Category"

    fill_in "Name", with: @movie_category.name
    click_on "Create Movie category"

    assert_text "Movie category was successfully created"
    click_on "Back"
  end

  test "updating a Movie category" do
    visit movie_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @movie_category.name
    click_on "Update Movie category"

    assert_text "Movie category was successfully updated"
    click_on "Back"
  end

  test "destroying a Movie category" do
    visit movie_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movie category was successfully destroyed"
  end
end
