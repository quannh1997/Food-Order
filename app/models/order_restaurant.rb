class OrderRestaurant < ApplicationRecord
  belongs_to :order
  belongs_to :restaurant
end
