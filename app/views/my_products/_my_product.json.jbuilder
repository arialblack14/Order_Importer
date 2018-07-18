json.extract! my_product, :id, :product_id, :name, :price, :description, :specs, :tags, :permalink, :position, :cost, :hts, :created_at, :updated_at
json.url my_product_url(my_product, format: :json)
