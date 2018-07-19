ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "2ce11a2ac2cfb3975507e23a64909b7d"
  config.secret = "d012148737bd3aa5aa1fdc4e93dbeecc"
  config.scope = "read_orders, read_products, write_orders"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
