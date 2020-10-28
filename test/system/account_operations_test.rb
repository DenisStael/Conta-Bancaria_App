require "application_system_test_case"

class AccountOperationsTest < ApplicationSystemTestCase
  setup do
    @account_operation = account_operations(:one)
  end

  test "visiting the index" do
    visit account_operations_url
    assert_selector "h1", text: "Account Operations"
  end

  test "creating a Account operation" do
    visit account_operations_url
    click_on "New Account Operation"

    fill_in "Date operation", with: @account_operation.date_operation
    fill_in "Number account", with: @account_operation.number_account
    fill_in "Operation", with: @account_operation.operation
    fill_in "Value", with: @account_operation.value
    click_on "Create Account operation"

    assert_text "Account operation was successfully created"
    click_on "Back"
  end

  test "updating a Account operation" do
    visit account_operations_url
    click_on "Edit", match: :first

    fill_in "Date operation", with: @account_operation.date_operation
    fill_in "Number account", with: @account_operation.number_account
    fill_in "Operation", with: @account_operation.operation
    fill_in "Value", with: @account_operation.value
    click_on "Update Account operation"

    assert_text "Account operation was successfully updated"
    click_on "Back"
  end

  test "destroying a Account operation" do
    visit account_operations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Account operation was successfully destroyed"
  end
end
