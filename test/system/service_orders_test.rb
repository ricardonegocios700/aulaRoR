require "application_system_test_case"

class ServiceOrdersTest < ApplicationSystemTestCase
  setup do
    @service_order = service_orders(:one)
  end

  test "visiting the index" do
    visit service_orders_url
    assert_selector "h1", text: "Service Orders"
  end

  test "creating a Service order" do
    visit service_orders_url
    click_on "New Service Order"

    fill_in "End time", with: @service_order.end_time
    fill_in "Machine status", with: @service_order.machine_status_id
    fill_in "Os type", with: @service_order.os_type_id
    fill_in "Request", with: @service_order.request_id
    fill_in "Start time", with: @service_order.start_time
    click_on "Create Service order"

    assert_text "Service order was successfully created"
    click_on "Back"
  end

  test "updating a Service order" do
    visit service_orders_url
    click_on "Edit", match: :first

    fill_in "End time", with: @service_order.end_time
    fill_in "Machine status", with: @service_order.machine_status_id
    fill_in "Os type", with: @service_order.os_type_id
    fill_in "Request", with: @service_order.request_id
    fill_in "Start time", with: @service_order.start_time
    click_on "Update Service order"

    assert_text "Service order was successfully updated"
    click_on "Back"
  end

  test "destroying a Service order" do
    visit service_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Service order was successfully destroyed"
  end
end
