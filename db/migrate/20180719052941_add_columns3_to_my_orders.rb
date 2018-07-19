class AddColumns3ToMyOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :my_orders, :Shipping_Phone, :string
    add_column :my_orders, :Notes, :text
    add_column :my_orders, :Note_Attributes, :string
    add_column :my_orders, :Cancelled_at, :datetime
    add_column :my_orders, :Payment_Method, :string
    add_column :my_orders, :Payment_Reference, :string
    add_column :my_orders, :Refunded_Amount, :float
    add_column :my_orders, :Vendor, :string
    add_column :my_orders, :OrderId, :float
    add_column :my_orders, :Tags, :string
    add_column :my_orders, :Risk_Level, :string
    add_column :my_orders, :Source, :string
    add_column :my_orders, :Lineitem_discount, :float
    add_column :my_orders, :Tax_1_Name, :string
    add_column :my_orders, :Tax_1_Value, :float
    add_column :my_orders, :Tax_2_Name, :string
    add_column :my_orders, :Tax_2_Value, :float
    add_column :my_orders, :Tax_3_Name, :string
    add_column :my_orders, :Tax_3_Value, :float
    add_column :my_orders, :Tax_4_Name, :string
    add_column :my_orders, :Tax_4_Value, :float
    add_column :my_orders, :Tax_5_Name, :string
    add_column :my_orders, :Tax_5_Value, :float
    add_column :my_orders, :Phone, :string
  end
end
