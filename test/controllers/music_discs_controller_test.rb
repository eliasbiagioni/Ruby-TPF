require 'test_helper'

class MusicDiscsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @music_disc = music_discs(:one)
  end

  test "should get index" do
    get music_discs_url
    assert_response :success
  end

  test "should get new" do
    get new_music_disc_url
    assert_response :success
  end

  test "should create music_disc" do
    assert_difference('MusicDisc.count') do
      post music_discs_url, params: { music_disc: { discography: @music_disc.discography, group_name: @music_disc.group_name, name: @music_disc.name } }
    end

    assert_redirected_to music_disc_url(MusicDisc.last)
  end

  test "should show music_disc" do
    get music_disc_url(@music_disc)
    assert_response :success
  end

  test "should get edit" do
    get edit_music_disc_url(@music_disc)
    assert_response :success
  end

  test "should update music_disc" do
    patch music_disc_url(@music_disc), params: { music_disc: { discography: @music_disc.discography, group_name: @music_disc.group_name, name: @music_disc.name } }
    assert_redirected_to music_disc_url(@music_disc)
  end

  test "should destroy music_disc" do
    assert_difference('MusicDisc.count', -1) do
      delete music_disc_url(@music_disc)
    end

    assert_redirected_to music_discs_url
  end
end
