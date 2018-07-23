# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_23_193555) do

  create_table "my_orders", force: :cascade do |t|
    t.string "Name"
    t.string "Email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Financial_Status"
    t.string "Paid_at"
    t.string "Fulfillment_Status"
    t.string "Fulfilled_at"
    t.string "Accepts_Marketing"
    t.string "Currency"
    t.float "Subtotal"
    t.string "Shipping"
    t.float "Taxes"
    t.float "Total"
    t.string "Discount_Code"
    t.float "Discount_Amount"
    t.string "Shipping_Method"
    t.integer "Lineitem_quantity"
    t.string "Lineitem_name"
    t.float "Lineitem_price"
    t.float "Lineitem_compare_at_price"
    t.integer "Lineitem_sku"
    t.boolean "Lineitem_requires_shipping"
    t.boolean "Lineitem_taxable"
    t.string "Lineitem_fulfillment_status"
    t.string "Billing_Name"
    t.string "Billing_Street"
    t.string "Billing_Address1"
    t.string "Billing_Address2"
    t.string "Billing_Company"
    t.string "Billing_City"
    t.integer "Billing_Zip"
    t.string "Billing_Province"
    t.string "Billing_Country"
    t.string "Billing_Phone"
    t.string "Shipping_Name"
    t.string "Shipping_Street"
    t.string "Shipping_Address1"
    t.string "Shipping_Address2"
    t.string "Shipping_Company"
    t.string "Shipping_City"
    t.integer "Shipping_Zip"
    t.string "Shipping_Province"
    t.string "Shipping_Country"
    t.string "Shipping_Phone"
    t.text "Notes"
    t.string "Note_Attributes"
    t.datetime "Cancelled_at"
    t.string "Payment_Method"
    t.string "Payment_Reference"
    t.float "Refunded_Amount"
    t.string "Vendor"
    t.string "OrderId"
    t.string "Tags"
    t.string "Risk_Level"
    t.string "Source"
    t.float "Lineitem_discount"
    t.string "Tax_1_Name"
    t.float "Tax_1_Value"
    t.string "Tax_2_Name"
    t.float "Tax_2_Value"
    t.string "Tax_3_Name"
    t.float "Tax_3_Value"
    t.string "Tax_4_Name"
    t.float "Tax_4_Value"
    t.string "Tax_5_Name"
    t.float "Tax_5_Value"
    t.string "Phone"
  end

  create_table "my_products", force: :cascade do |t|
    t.string "myproduct_id"
    t.string "name"
    t.integer "price"
    t.text "description"
    t.text "specs"
    t.text "tags"
    t.string "permalink"
    t.float "position"
    t.float "cost"
    t.float "hts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

end
