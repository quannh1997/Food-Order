json.extract! restaurant, :id, :name, :average_star, :selected_count, :address, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
