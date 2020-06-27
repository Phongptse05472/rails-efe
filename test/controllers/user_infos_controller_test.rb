require 'test_helper'

class UserInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = user_infos(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: {customer: {avata: @customer.avata, is_active: @customer.is_active, name: @customer.name, phone_number: @customer.phone_number, role_id: @customer.role_id, roll_number: @customer.roll_number } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: {customer: {avata: @customer.avata, is_active: @customer.is_active, name: @customer.name, phone_number: @customer.phone_number, role_id: @customer.role_id, roll_number: @customer.roll_number } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
