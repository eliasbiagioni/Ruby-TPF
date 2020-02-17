require "application_system_test_case"

class MusicCategoriesTest < ApplicationSystemTestCase
  setup do
    @music_category = music_categories(:one)
  end

  test "visiting the index" do
    visit music_categories_url
    assert_selector "h1", text: "Music Categories"
  end

  test "creating a Music category" do
    visit music_categories_url
    click_on "New Music Category"

    fill_in "Name", with: @music_category.name
    click_on "Create Music category"

    assert_text "Music category was successfully created"
    click_on "Back"
  end

  test "updating a Music category" do
    visit music_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @music_category.name
    click_on "Update Music category"

    assert_text "Music category was successfully updated"
    click_on "Back"
  end

  test "destroying a Music category" do
    visit music_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Music category was successfully destroyed"
  end
end
