class CreateMyOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :my_orders do |t|
      t.string :Name
      t.string :Email
      # add_column :my_orders, :Financial_Status, :string
      # t.string :Financial_Status
      # t.string :Paid_at
      # t.string :Fulfillment_Status
      # t.string :Fulfilled_at
      # t.string :Accepts_Marketing
      # t.string :Currency
      # t.float :Subtotal
      # t.float :Shipping
      # t.float :Taxes
      # t.float :Total
      # t.string :Discount_Code
      # t.float :Discount_Amount
      # t.string :Shipping_Method
      # t.datetime :Created_at
      # t.integer :Lineitem_quantity
      # t.string :Lineitem_name
      # t.float :Lineitem_price
      # t.float :Lineitem_compare_at_price
      # t.integer :Lineitem_sku
      # t.boolean :Lineitem_requires_shipping
      # t.boolean :Lineitem_taxable
      # t.string :Lineitem_fulfillment_status
      # t.string :Billing_Name
      # t.string :Billing_Street
      # t.string :Billing_Address1
      # t.string :Billing_Address2
      # t.string :Billing_Company
      # t.string :Billing_City
      # t.integer :Billing_Zip
      # t.string :Billing_Province
      # t.string :Billing_Country
      # t.string :Billing_Phone
      # t.string :Shipping_Name
      # t.string :Shipping_Street
      # t.string :Shipping_Address1
      # t.string :Shipping_Address2
      # t.string :Shipping_Company
      # t.string :Shipping_City
      # t.integer :Shipping_Zip
      # t.string :Shipping_Province
      # t.string :Shipping_Country
      # t.string :Shipping_Phone
      # t.text :Notes
      # t.string :Note_Attributes
      # t.datetime :Cancelled_at
      # t.string :Payment_Method
      # t.string :Payment_Reference
      # t.float :Refunded_Amount
      # t.string :Vendor
      # t.float :Id
      # t.string :Tags
      # t.string :Risk_Level
      # t.string :Source
      # t.float :Lineitem_discount
      # t.string :Tax_1_Name
      # t.float :Tax_1_Value
      # t.string :Tax_2_Name
      # t.float :Tax_2_Value
      # t.string :Tax_3_Name
      # t.float :Tax_3_Value
      # t.string :Tax_4_Name
      # t.float :Tax_4_Value
      # t.string :Tax_5_Name
      # t.float :Tax_5_Value
      # t.string :Phone

      t.timestamps
    end
  end
end
