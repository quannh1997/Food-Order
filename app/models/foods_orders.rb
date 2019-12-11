class FoodOrder < ApplicationRecord
  # has_secure_token :code #https://makandracards.com/alexander-m/39365-generate-unique-random-token
  self.table_name = "food_orders"
end

