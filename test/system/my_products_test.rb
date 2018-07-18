require "application_system_test_case"

class MyProductsTest < ApplicationSystemTestCase
  setup do
    @my_product = my_products(:one)
  end

  test "visiting the index" do
    visit my_products_url
    assert_selector "h1", text: "My Products"
  end

  test "creating a My product" do
    visit my_products_url
    click_on "New My Product"

    fill_in "Cost", with: @my_product.cost
    fill_in "Description", with: @my_product.description
    fill_in "Hts", with: @my_product.hts
    fill_in "Name", with: @my_product.name
    fill_in "Permalink", with: @my_product.permalink
    fill_in "Position", with: @my_product.position
    fill_in "Price", with: @my_product.price
    fill_in "Product", with: @my_product.product_id
    fill_in "Specs", with: @my_product.specs
    fill_in "Tags", with: @my_product.tags
    click_on "Create My product"

    assert_text "My product was successfully created"
    click_on "Back"
  end

  test "updating a My product" do
    visit my_products_url
    click_on "Edit", match: :first

    fill_in "Cost", with: @my_product.cost
    fill_in "Description", with: @my_product.description
    fill_in "Hts", with: @my_product.hts
    fill_in "Name", with: @my_product.name
    fill_in "Permalink", with: @my_product.permalink
    fill_in "Position", with: @my_product.position
    fill_in "Price", with: @my_product.price
    fill_in "Product", with: @my_product.product_id
    fill_in "Specs", with: @my_product.specs
    fill_in "Tags", with: @my_product.tags
    click_on "Update My product"

    assert_text "My product was successfully updated"
    click_on "Back"
  end

  test "destroying a My product" do
    visit my_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "My product was successfully destroyed"
  end
end
