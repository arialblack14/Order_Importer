class MyOrder < ApplicationRecord
  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |product|
        csv << product.attributes.values_at(*fields)
      end
    end
  end

  def self.import(file)
    shop = Shop.first
    session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token, '')
    ShopifyAPI::Base.activate_session(session)
    
    pre_order_number = nil
    CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
      if(row.to_hash["Return"] != "yes")
        pre_order_number = row.to_hash["OrderId"]
        break
      end
    end
    pre_line_item = []
    pre_email = nil
    pre_address = nil
    
    pre_total_price = 0
    string_pre_total_price = nil
      # ShopifyAPI::Order.create!(email:"goooo@example.com",fulfillment_status:"fulfilled",send_receipt:true,send_fulfillment_receipt:true,
      # total_price:"2333.00",subtotal:"2331.00",total_tax:"0.00","currency":"USD",financial_status:"pending",
      # line_items:[ShopifyAPI::LineItem.new(title:"dummy",quantity:1,price:"2333.00",sku:"0"),ShopifyAPI::LineItem.new(title:"zzzzzz",quantity:1,price:"2333.00",sku:"0"),],confirmed:true,
      # total_discounts:"0.00",total_line_items_price:"2333.00",total_price_usd:"2333.00", 
      # address: [ShopifyAPI::ShippingAddress.new(first_name:"go", last_name:"went",address1:"123", address2:"345",
      #   province:"345", country_code:"4444444", zip:"555555555", phone:"333-444-5555")])
    CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
      if(row.to_hash["Return"] == "yes")
        next
      end
      # product_hash = row.to_hash
      # product = find_or_create_by!(name: product_hash['name'], category: product_hash['category'])
      # product.update_attributes(product_hash)
      # shop = Shop.first
      # puts shop.shopify_domain
      # puts row.to_hash["Email"]
      # session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token, '')
      # ShopifyAPI::Base.activate_session(session)
      #MyOrder .create! row.to_hash
      #puts "import success"
      #ShopifyAPI::Order .create!(email:row.to_hash["Email"], line_items: [ShopifyAPI::LineItem.new(title:"dummy",quantity:1)])
      ShopifyAPI::Order.create(email:row.to_hash["Email"],fulfillment_status:"fulfilled",send_receipt:true,send_fulfillment_receipt:true,
      total_price:"2333.00",subtotal:"2331.00",total_tax:"0.00",currency:"USD",financial_status:"pending",
      line_items:[ShopifyAPI::LineItem.new(title:"dummy",quantity:1,price:"2333.00",sku:"0"),ShopifyAPI::LineItem.new(title:"zzzzzz",quantity:1,price:"2333.00",sku:"0"),],confirmed:true,
      total_discounts:"0.00",total_line_items_price:"2333.00",total_price_usd:"2333.00") 
      
      
      cur_order_number = row.to_hash["OrderId"]
      if(pre_order_number == cur_order_number)
        pre_line_item.push(ShopifyAPI::LineItem.new(title:row.to_hash["Lineitem_name"], price:row.to_hash["Lineitem_price"], properties:[name:"size", value:row.to_hash["Notes"]],quantity:row.to_hash["Lineitem_quantity"]))
        
        pre_total_price = pre_total_price + row.to_hash["Lineitem_price"].to_f
        
        pre_address = ShopifyAPI::ShippingAddress.new(address1:row.to_hash["Shipping_Address1"], address2:row.to_hash["Shipping_Address2"],
        province:row.to_hash["Shipping_Province"], country_code:row.to_hash["Shipping_Country"], zip:row.to_hash["Shipping_Zip"])
        
        pre_email = row.to_hash["Email"]
        
        pre_order_number = cur_order_number
      else
        string_pre_total_price = pre_total_price.to_s
        # ShopifyAPI::Order.create!(email:pre_email, total_price:string_pre_total_price, fulfillment_status:"fulfilled", send_receipt:true,
        # financial_status:"pending", send_fulfillment_receipt:true, order_number:pre_order_number, total_discounts:"0.00",
        # "currency":"USD",line_items:pre_line_item, shipping_address: pre_address)
        
        #puts string_pre_total_price
        
        puts pre_address.address1
        
        
        ShopifyAPI::Order.create!(email:pre_email,fulfillment_status:"fulfilled",send_receipt:true,send_fulfillment_receipt:true,
        total_price:string_pre_total_price,subtotal:string_pre_total_price,total_tax:"0.00",currency:"USD",financial_status:"pending",
        line_items:pre_line_item,confirmed:true,
        total_discounts:"0.00",total_line_items_price:"2333.00",total_price_usd:"2333.00", shipping_address: pre_address, created_at:row.to_hash["OrderDate"]) 
        
        pre_total_price = row.to_hash["Lineitem_price"].to_f
        
        pre_line_item.clear
        pre_line_item.push(ShopifyAPI::LineItem.new(title:row.to_hash["Lineitem_name"], price:row.to_hash["Lineitem_price"], properties:[name:"size", value:row.to_hash["Notes"]],quantity:row.to_hash["Lineitem_quantity"]))
        
        pre_address = ShopifyAPI::ShippingAddress.new(address1:row.to_hash["Shipping_Address1"], address2:row.to_hash["Shipping_Address2"],
        province:row.to_hash["Shipping_Province"], country_code:row.to_hash["Shipping_Country"], zip:row.to_hash["Shipping_Zip"])
        
        pre_email = row.to_hash["Email"]
        pre_order_number = cur_order_number
      end
    end
    string_pre_total_price = pre_total_price.to_s
    ShopifyAPI::Order.create!(email:pre_email,fulfillment_status:"fulfilled",send_receipt:true,send_fulfillment_receipt:true,
        total_price:string_pre_total_price,subtotal:string_pre_total_price,total_tax:"0.00",currency:"USD",financial_status:"pending",
        line_items:pre_line_item,confirmed:true,
        total_discounts:"0.00",total_line_items_price:"2333.00",total_price_usd:"2333.00",shipping_address: pre_address)
  end
end

# class MyOrder < ApplicationRecord
#   def self.to_csv(fields = column_names, options = {})
#     CSV.generate(options) do |csv|
#       csv << fields
#       all.each do |product|
#         csv << product.attributes.values_at(*fields)
#       end
#     end
#   end

#   def self.import(file)
#     shop = Shop.first
#     session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token, '')
#     ShopifyAPI::Base.activate_session(session)
#     CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
#       # product_hash = row.to_hash
#       # product = find_or_create_by!(name: product_hash['name'], category: product_hash['category'])
#       # product.update_attributes(product_hash)
#       # shop = Shop.first
#       # puts shop.shopify_domain
#       # puts row.to_hash["Email"]
#       # session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token, '')
#       # ShopifyAPI::Base.activate_session(session)
#       MyOrder .create! row.to_hash
#       #ShopifyAPI::Order .create!(email:row.to_hash["Email"], line_items: [ShopifyAPI::LineItem.new(title:"dummy",quantity:1)])
#       ShopifyAPI::Order.create(email:row.to_hash["Email"],fulfillment_status:"fulfilled",send_receipt:true,send_fulfillment_receipt:true,
#       total_price:"2333.00",subtotal:"2331.00",total_tax:"0.00","currency":"USD",financial_status:"pending",
#       line_items:[ShopifyAPI::LineItem.new(title:"dummy",quantity:1,price:"2333.00",sku:"0")],confirmed:true,
#       total_discounts:"0.00",total_line_items_price:"2333.00",total_price_usd:"2333.00") 
#     end
#   end
# end
