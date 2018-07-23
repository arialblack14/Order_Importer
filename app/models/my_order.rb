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
    pre_order_number = "R865127007"
    pre_line_item = []
    pre_email = "coltonschumacher@gmail.com"
    pre_address = nil
    CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
      # product_hash = row.to_hash
      # product = find_or_create_by!(name: product_hash['name'], category: product_hash['category'])
      # product.update_attributes(product_hash)
      # shop = Shop.first
      # puts shop.shopify_domain
      # puts row.to_hash["Email"]
      # session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token, '')
      # ShopifyAPI::Base.activate_session(session)
      MyOrder .create! row.to_hash
      #ShopifyAPI::Order .create!(email:row.to_hash["Email"], line_items: [ShopifyAPI::LineItem.new(title:"dummy",quantity:1)])
      # ShopifyAPI::Order.create(email:row.to_hash["Email"],fulfillment_status:"fulfilled",send_receipt:true,send_fulfillment_receipt:true,
      # total_price:"2333.00",subtotal:"2331.00",total_tax:"0.00","currency":"USD",financial_status:"pending",
      # line_items:[ShopifyAPI::LineItem.new(title:"dummy",quantity:1,price:"2333.00",sku:"0"),ShopifyAPI::LineItem.new(title:"zzzzzz",quantity:1,price:"2333.00",sku:"0"),],confirmed:true,
      # total_discounts:"0.00",total_line_items_price:"2333.00",total_price_usd:"2333.00") 
      cur_order_number = row.to_hash["OrderId"]
      if(pre_order_number == cur_order_number)
        pre_line_item.push(ShopifyAPI::LineItem.new(name:row.to_hash["Lineitem_name"], price:row.to_hash["Lineitem_price"], properties:[name:"size", value:row.to_hash["Notes"]]))
        
        pre_address = ShopifyAPI::ShippingAddress.new(address1:row.to_hash["Shipping_Address1"], address2:row.to_hash["Shipping_Address2"],
        province:row.to_hash["Shipping_Province"], country_code:row.to_hash["Shipping_Country"], zip:row.to_hash["Shipping_Zip"])
        
        pre_email = row.to_hash["Email"]
        pre_order_number = cur_order_number
      else
        ShopifyAPI::Order.create(email:pre_email, order_number:pre_order_number, line_items:pre_line_item, shipping_address: pre_address)
        pre_line_item.clear
        pre_line_item.push[ShopifyAPI::LineItem.new(name:row.to_hash["Lineitem_name"], price:row.to_hash["Lineitem_price"], properties:[name:"size", value:row.to_hash["Notes"]])]
        
        pre_address = ShopifyAPI::ShippingAddress.new(address1:row.to_hash["Shipping_Address1"], address2:row.to_hash["Shipping_Address2"],
        province:row.to_hash["Shipping_Province"], country_code:row.to_hash["Shipping_Country"], zip:row.to_hash["Shipping_Zip"])
        
        pre_email = row.to_hash["Email"]
        pre_order_number = cur_order_number
      end
      
    end
  end
end
