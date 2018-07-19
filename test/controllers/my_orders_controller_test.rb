require 'test_helper'

class MyOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_order = my_orders(:one)
  end

  test "should get index" do
    get my_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_my_order_url
    assert_response :success
  end

  test "should create my_order" do
    assert_difference('MyOrder.count') do
      post my_orders_url, params: { my_order: { Name: @my_order.Name } }
    end

    assert_redirected_to my_order_url(MyOrder.last)
  end

  test "should show my_order" do
    get my_order_url(@my_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_order_url(@my_order)
    assert_response :success
  end

  test "should update my_order" do
    patch my_order_url(@my_order), params: { my_order: { Name: @my_order.Name } }
    assert_redirected_to my_order_url(@my_order)
  end

  test "should destroy my_order" do
    assert_difference('MyOrder.count', -1) do
      delete my_order_url(@my_order)
    end

    assert_redirected_to my_orders_url
  end
end
