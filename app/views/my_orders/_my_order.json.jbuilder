json.extract! my_order, :id, :Name, :created_at, :updated_at
json.url my_order_url(my_order, format: :json)
