require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Description", with: @product.description
    fill_in "Drawing", with: @product.drawing
    check "Excluded" if @product.excluded
    fill_in "Machine type", with: @product.machine_type_id
    fill_in "Note", with: @product.note
    fill_in "Pallet", with: @product.pallet
    fill_in "Person", with: @product.person_id
    fill_in "Product", with: @product.product_id
    fill_in "Production time", with: @product.production_time
    fill_in "Volume", with: @product.volume_id
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Description", with: @product.description
    fill_in "Drawing", with: @product.drawing
    check "Excluded" if @product.excluded
    fill_in "Machine type", with: @product.machine_type_id
    fill_in "Note", with: @product.note
    fill_in "Pallet", with: @product.pallet
    fill_in "Person", with: @product.person_id
    fill_in "Product", with: @product.product_id
    fill_in "Production time", with: @product.production_time
    fill_in "Volume", with: @product.volume_id
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
