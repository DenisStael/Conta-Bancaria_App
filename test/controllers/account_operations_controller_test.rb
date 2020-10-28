require 'test_helper'

class AccountOperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account_operation = account_operations(:one)
  end

  test "should get index" do
    get account_operations_url
    assert_response :success
  end

  test "should get new" do
    get new_account_operation_url
    assert_response :success
  end

  test "should create account_operation" do
    assert_difference('AccountOperation.count') do
      post account_operations_url, params: { account_operation: { date_operation: @account_operation.date_operation, number_account: @account_operation.number_account, operation: @account_operation.operation, value: @account_operation.value } }
    end

    assert_redirected_to account_operation_url(AccountOperation.last)
  end

  test "should show account_operation" do
    get account_operation_url(@account_operation)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_operation_url(@account_operation)
    assert_response :success
  end

  test "should update account_operation" do
    patch account_operation_url(@account_operation), params: { account_operation: { date_operation: @account_operation.date_operation, number_account: @account_operation.number_account, operation: @account_operation.operation, value: @account_operation.value } }
    assert_redirected_to account_operation_url(@account_operation)
  end

  test "should destroy account_operation" do
    assert_difference('AccountOperation.count', -1) do
      delete account_operation_url(@account_operation)
    end

    assert_redirected_to account_operations_url
  end
end
