require "application_system_test_case"

class MachinesTest < ApplicationSystemTestCase
  setup do
    @machine = machines(:one)
  end

  test "visiting the index" do
    visit machines_url
    assert_selector "h1", text: "Machines"
  end

  test "creating a Machine" do
    visit machines_url
    click_on "New Machine"

    fill_in "Description", with: @machine.description
    check "Excluded" if @machine.excluded
    fill_in "Machine maintenance", with: @machine.machine_maintenance_id
    fill_in "Machine status", with: @machine.machine_status_id
    fill_in "Machine type", with: @machine.machine_type_id
    fill_in "Manufacturer", with: @machine.manufacturer
    fill_in "Model", with: @machine.model
    fill_in "Nick", with: @machine.nick
    fill_in "Note", with: @machine.note
    click_on "Create Machine"

    assert_text "Machine was successfully created"
    click_on "Back"
  end

  test "updating a Machine" do
    visit machines_url
    click_on "Edit", match: :first

    fill_in "Description", with: @machine.description
    check "Excluded" if @machine.excluded
    fill_in "Machine maintenance", with: @machine.machine_maintenance_id
    fill_in "Machine status", with: @machine.machine_status_id
    fill_in "Machine type", with: @machine.machine_type_id
    fill_in "Manufacturer", with: @machine.manufacturer
    fill_in "Model", with: @machine.model
    fill_in "Nick", with: @machine.nick
    fill_in "Note", with: @machine.note
    click_on "Update Machine"

    assert_text "Machine was successfully updated"
    click_on "Back"
  end

  test "destroying a Machine" do
    visit machines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Machine was successfully destroyed"
  end
end
