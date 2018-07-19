class AddColumns2ToMyOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :my_orders, :Lineitem_taxable, :boolean
    add_column :my_orders, :Lineitem_fulfillment_status, :string
    add_column :my_orders, :Billing_Name, :string
    add_column :my_orders, :Billing_Street, :string
    add_column :my_orders, :Billing_Address1, :string
    add_column :my_orders, :Billing_Address2, :string
    add_column :my_orders, :Billing_Company, :string
    add_column :my_orders, :Billing_City, :string
    add_column :my_orders, :Billing_Zip, :integer
    add_column :my_orders, :Billing_Province, :string
    add_column :my_orders, :Billing_Country, :string
    add_column :my_orders, :Billing_Phone, :string
    add_column :my_orders, :Shipping_Name, :string
    add_column :my_orders, :Shipping_Street, :string
    add_column :my_orders, :Shipping_Address1, :string
    add_column :my_orders, :Shipping_Address2, :string
    add_column :my_orders, :Shipping_Company, :string
    add_column :my_orders, :Shipping_City, :string
    add_column :my_orders, :Shipping_Zip, :integer
    add_column :my_orders, :Shipping_Province, :string
    add_column :my_orders, :Shipping_Country, :string
  end
end
