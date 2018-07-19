class AddColumns1ToMyOrders < ActiveRecord::Migration[5.2]
  def change
    # add_column :my_orders, :Taxes, :float
    # add_column :my_orders, :Total, :float
    # add_column :my_orders, :Discount_Code, :string
    # add_column :my_orders, :Discount_Amount, :float
    # add_column :my_orders, :Shipping_Method, :string
    # add_column :my_orders, :Created_at, :datetime
    add_column :my_orders, :Lineitem_quantity, :integer
    add_column :my_orders, :Lineitem_name, :string
    add_column :my_orders, :Lineitem_price, :float
    add_column :my_orders, :Lineitem_compare_at_price, :float
    add_column :my_orders, :Lineitem_sku, :integer
    add_column :my_orders, :Lineitem_requires_shipping, :boolean
  end
end
