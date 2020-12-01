require "application_system_test_case"

class ShiftsTest < ApplicationSystemTestCase
  setup do
    @shift = shifts(:one)
  end

  test "visiting the index" do
    visit shifts_url
    assert_selector "h1", text: "Shifts"
  end

  test "creating a Shift" do
    visit shifts_url
    click_on "New Shift"

    fill_in "Description", with: @shift.description
    fill_in "Endtime time", with: @shift.endtime_time
    check "Excluded" if @shift.excluded
    check "Fifth" if @shift.fifth
    check "Fourth" if @shift.fourth
    check "Friday" if @shift.friday
    check "Monday" if @shift.monday
    check "Saturday" if @shift.saturday
    fill_in "Start time", with: @shift.start_time
    check "Sunday" if @shift.sunday
    check "Tuesday" if @shift.tuesday
    click_on "Create Shift"

    assert_text "Shift was successfully created"
    click_on "Back"
  end

  test "updating a Shift" do
    visit shifts_url
    click_on "Edit", match: :first

    fill_in "Description", with: @shift.description
    fill_in "Endtime time", with: @shift.endtime_time
    check "Excluded" if @shift.excluded
    check "Fifth" if @shift.fifth
    check "Fourth" if @shift.fourth
    check "Friday" if @shift.friday
    check "Monday" if @shift.monday
    check "Saturday" if @shift.saturday
    fill_in "Start time", with: @shift.start_time
    check "Sunday" if @shift.sunday
    check "Tuesday" if @shift.tuesday
    click_on "Update Shift"

    assert_text "Shift was successfully updated"
    click_on "Back"
  end

  test "destroying a Shift" do
    visit shifts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shift was successfully destroyed"
  end
end
