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
    CSV.foreach(file.path, headers: true, encoding: 'iso-8859-1:utf-8') do |row|
      # product_hash = row.to_hash
      # product = find_or_create_by!(name: product_hash['name'], category: product_hash['category'])
      # product.update_attributes(product_hash)
      shop = Shop.first
      puts shop.shopify_domain
      puts row.to_hash["Email"]
      session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token, '')
      ShopifyAPI::Base.activate_session(session)
      MyOrder .create! row.to_hash
      ShopifyAPI::Order .create! row.to_hash
    end
  end
end
