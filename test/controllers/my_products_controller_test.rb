require 'test_helper'

class MyProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_product = my_products(:one)
  end

  test "should get index" do
    get my_products_url
    assert_response :success
  end

  test "should get new" do
    get new_my_product_url
    assert_response :success
  end

  test "should create my_product" do
    assert_difference('MyProduct.count') do
      post my_products_url, params: { my_product: { cost: @my_product.cost, description: @my_product.description, hts: @my_product.hts, name: @my_product.name, permalink: @my_product.permalink, position: @my_product.position, price: @my_product.price, product_id: @my_product.product_id, specs: @my_product.specs, tags: @my_product.tags } }
    end

    assert_redirected_to my_product_url(MyProduct.last)
  end

  test "should show my_product" do
    get my_product_url(@my_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_product_url(@my_product)
    assert_response :success
  end

  test "should update my_product" do
    patch my_product_url(@my_product), params: { my_product: { cost: @my_product.cost, description: @my_product.description, hts: @my_product.hts, name: @my_product.name, permalink: @my_product.permalink, position: @my_product.position, price: @my_product.price, product_id: @my_product.product_id, specs: @my_product.specs, tags: @my_product.tags } }
    assert_redirected_to my_product_url(@my_product)
  end

  test "should destroy my_product" do
    assert_difference('MyProduct.count', -1) do
      delete my_product_url(@my_product)
    end

    assert_redirected_to my_products_url
  end
end
