class OrderRestaurant < ApplicationRecord
  # has_secure_token :code #https://makandracards.com/alexander-m/39365-generate-unique-random-token
  self.table_name = "orders_restaurants"
end
