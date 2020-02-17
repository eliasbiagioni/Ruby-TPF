require "application_system_test_case"

class MusicDiscsTest < ApplicationSystemTestCase
  setup do
    @music_disc = music_discs(:one)
  end

  test "visiting the index" do
    visit music_discs_url
    assert_selector "h1", text: "Music Discs"
  end

  test "creating a Music disc" do
    visit music_discs_url
    click_on "New Music Disc"

    fill_in "Discography", with: @music_disc.discography
    fill_in "Group name", with: @music_disc.group_name
    fill_in "Name", with: @music_disc.name
    click_on "Create Music disc"

    assert_text "Music disc was successfully created"
    click_on "Back"
  end

  test "updating a Music disc" do
    visit music_discs_url
    click_on "Edit", match: :first

    fill_in "Discography", with: @music_disc.discography
    fill_in "Group name", with: @music_disc.group_name
    fill_in "Name", with: @music_disc.name
    click_on "Update Music disc"

    assert_text "Music disc was successfully updated"
    click_on "Back"
  end

  test "destroying a Music disc" do
    visit music_discs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Music disc was successfully destroyed"
  end
end
