class AddColumnsToMyOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :my_orders, :Financial_Status, :string
    add_column :my_orders, :Paid_at, :string
    add_column :my_orders, :Fulfillment_Status, :string
    add_column :my_orders, :Fulfilled_at, :string
    add_column :my_orders, :Accepts_Marketing, :string
    add_column :my_orders, :Currency, :string
    add_column :my_orders, :Subtotal, :float
    add_column :my_orders, :Shipping, :float
    add_column :my_orders, :Taxes, :float
    add_column :my_orders, :Total, :float
    add_column :my_orders, :Discount_Code, :string
    add_column :my_orders, :Discount_Amount, :float
    add_column :my_orders, :Shipping_Method, :string
    
  end
end
