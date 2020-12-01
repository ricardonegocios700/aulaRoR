require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "creating a Person" do
    visit people_url
    click_on "New Person"

    fill_in "Address", with: @person.address_id
    fill_in "Cnpj", with: @person.cnpj
    fill_in "Contact", with: @person.contact_id
    fill_in "Cpf", with: @person.cpf
    fill_in "Email", with: @person.email
    check "Excluded" if @person.excluded
    fill_in "Ie", with: @person.ie
    fill_in "Name", with: @person.name
    fill_in "Nickname", with: @person.nickname
    fill_in "Person type", with: @person.person_type_id
    fill_in "Rg", with: @person.rg
    fill_in "Shift", with: @person.shift_id
    fill_in "Telephone", with: @person.telephone
    fill_in "User", with: @person.user_id
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "updating a Person" do
    visit people_url
    click_on "Edit", match: :first

    fill_in "Address", with: @person.address_id
    fill_in "Cnpj", with: @person.cnpj
    fill_in "Contact", with: @person.contact_id
    fill_in "Cpf", with: @person.cpf
    fill_in "Email", with: @person.email
    check "Excluded" if @person.excluded
    fill_in "Ie", with: @person.ie
    fill_in "Name", with: @person.name
    fill_in "Nickname", with: @person.nickname
    fill_in "Person type", with: @person.person_type_id
    fill_in "Rg", with: @person.rg
    fill_in "Shift", with: @person.shift_id
    fill_in "Telephone", with: @person.telephone
    fill_in "User", with: @person.user_id
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end
