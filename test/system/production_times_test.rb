require "application_system_test_case"

class ProductionTimesTest < ApplicationSystemTestCase
  setup do
    @production_time = production_times(:one)
  end

  test "visiting the index" do
    visit production_times_url
    assert_selector "h1", text: "Production Times"
  end

  test "creating a Production time" do
    visit production_times_url
    click_on "New Production Time"

    fill_in "Description", with: @production_time.description
    check "Excluded" if @production_time.excluded
    fill_in "Note", with: @production_time.note
    fill_in "Time", with: @production_time.time
    click_on "Create Production time"

    assert_text "Production time was successfully created"
    click_on "Back"
  end

  test "updating a Production time" do
    visit production_times_url
    click_on "Edit", match: :first

    fill_in "Description", with: @production_time.description
    check "Excluded" if @production_time.excluded
    fill_in "Note", with: @production_time.note
    fill_in "Time", with: @production_time.time
    click_on "Update Production time"

    assert_text "Production time was successfully updated"
    click_on "Back"
  end

  test "destroying a Production time" do
    visit production_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Production time was successfully destroyed"
  end
end
