require "application_system_test_case"

class CoordinatesTest < ApplicationSystemTestCase
  setup do
    @coordinate = coordinates(:one)
  end

  test "visiting the index" do
    visit coordinates_url
    assert_selector "h1", text: "Coordinates"
  end

  test "should create coordinate" do
    visit coordinates_url
    click_on "New coordinate"

    fill_in "Latitude", with: @coordinate.latitude
    fill_in "Longitude", with: @coordinate.longitude
    click_on "Create Coordinate"

    assert_text "Coordinate was successfully created"
    click_on "Back"
  end

  test "should update Coordinate" do
    visit coordinate_url(@coordinate)
    click_on "Edit this coordinate", match: :first

    fill_in "Latitude", with: @coordinate.latitude
    fill_in "Longitude", with: @coordinate.longitude
    click_on "Update Coordinate"

    assert_text "Coordinate was successfully updated"
    click_on "Back"
  end

  test "should destroy Coordinate" do
    visit coordinate_url(@coordinate)
    click_on "Destroy this coordinate", match: :first

    assert_text "Coordinate was successfully destroyed"
  end
end
