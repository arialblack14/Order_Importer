desc 'say hello !'
task :hello_world do
  
  puts 'hello world'
  ShopifyAPI::Session.setup(api_key: '2ce11a2ac2cfb3975507e23a64909b7d', secret: 'd012148737bd3aa5aa1fdc4e93dbeecc')
  session = ShopifyAPI::Session.new("combatgent-test.myshopify.com")
  ShopifyAPI::Base.activate_session(session)
  #shop = ShopifyAPI::Shop.current
  #scope = ["write_products"]
  #permission_url = session.create_permission_url(scope)
  
  #token = session.request_token(params)
  
  new_product = ShopifyAPI::Product.new
  new_product.title = "Burton Custom Freestlye 151"
  new_product.product_type = "Snowboard"
  new_product.vendor = "Burton"
  new_product.save
end