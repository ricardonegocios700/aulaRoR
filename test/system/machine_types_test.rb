require "application_system_test_case"

class MachineTypesTest < ApplicationSystemTestCase
  setup do
    @machine_type = machine_types(:one)
  end

  test "visiting the index" do
    visit machine_types_url
    assert_selector "h1", text: "Machine Types"
  end

  test "creating a Machine type" do
    visit machine_types_url
    click_on "New Machine Type"

    fill_in "Description", with: @machine_type.description
    check "Excluded" if @machine_type.excluded
    fill_in "Note", with: @machine_type.note
    click_on "Create Machine type"

    assert_text "Machine type was successfully created"
    click_on "Back"
  end

  test "updating a Machine type" do
    visit machine_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @machine_type.description
    check "Excluded" if @machine_type.excluded
    fill_in "Note", with: @machine_type.note
    click_on "Update Machine type"

    assert_text "Machine type was successfully updated"
    click_on "Back"
  end

  test "destroying a Machine type" do
    visit machine_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Machine type was successfully destroyed"
  end
end
