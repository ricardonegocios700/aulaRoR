require "application_system_test_case"

class OrderServiceTypesTest < ApplicationSystemTestCase
  setup do
    @service_order_type = service_order_types(:one)
  end

  test "visiting the index" do
    visit service_order_types_url
    assert_selector "h1", text: "Order Service Types"
  end

  test "creating a Order service type" do
    visit service_order_types_url
    click_on "New Order Service Type"

    fill_in "Description", with: @service_order_type.description
    check "Excluded" if @service_order_type.excluded
    fill_in "Note", with: @service_order_type.note
    click_on "Create Order service type"

    assert_text "Order service type was successfully created"
    click_on "Back"
  end

  test "updating a Order service type" do
    visit service_order_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @service_order_type.description
    check "Excluded" if @service_order_type.excluded
    fill_in "Note", with: @service_order_type.note
    click_on "Update Order service type"

    assert_text "Order service type was successfully updated"
    click_on "Back"
  end

  test "destroying a Order service type" do
    visit service_order_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order service type was successfully destroyed"
  end
end
