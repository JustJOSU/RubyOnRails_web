json.extract! service, :id, :service_name, :price, :category_id, :user_id, :created_at, :updated_at
json.url service_url(service, format: :json)
