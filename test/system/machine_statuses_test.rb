require "application_system_test_case"

class MachineStatusesTest < ApplicationSystemTestCase
  setup do
    @machine_status = machine_statuses(:one)
  end

  test "visiting the index" do
    visit machine_statuses_url
    assert_selector "h1", text: "Machine Statuses"
  end

  test "creating a Machine status" do
    visit machine_statuses_url
    click_on "New Machine Status"

    fill_in "Description", with: @machine_status.description
    check "Excluded" if @machine_status.excluded
    fill_in "Note", with: @machine_status.note
    click_on "Create Machine status"

    assert_text "Machine status was successfully created"
    click_on "Back"
  end

  test "updating a Machine status" do
    visit machine_statuses_url
    click_on "Edit", match: :first

    fill_in "Description", with: @machine_status.description
    check "Excluded" if @machine_status.excluded
    fill_in "Note", with: @machine_status.note
    click_on "Update Machine status"

    assert_text "Machine status was successfully updated"
    click_on "Back"
  end

  test "destroying a Machine status" do
    visit machine_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Machine status was successfully destroyed"
  end
end
