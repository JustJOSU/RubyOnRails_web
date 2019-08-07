json.extract! user_service, :id, :user_id, :service_id, :created_at, :updated_at
json.url user_service_url(user_service, format: :json)
