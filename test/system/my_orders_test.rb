require "application_system_test_case"

class MyOrdersTest < ApplicationSystemTestCase
  setup do
    @my_order = my_orders(:one)
  end

  test "visiting the index" do
    visit my_orders_url
    assert_selector "h1", text: "My Orders"
  end

  test "creating a My order" do
    visit my_orders_url
    click_on "New My Order"

    fill_in "Name", with: @my_order.Name
    click_on "Create My order"

    assert_text "My order was successfully created"
    click_on "Back"
  end

  test "updating a My order" do
    visit my_orders_url
    click_on "Edit", match: :first

    fill_in "Name", with: @my_order.Name
    click_on "Update My order"

    assert_text "My order was successfully updated"
    click_on "Back"
  end

  test "destroying a My order" do
    visit my_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "My order was successfully destroyed"
  end
end
