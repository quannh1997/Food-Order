class Order < ApplicationRecord
  has_many :order_per_food
  belongs_to :user
  belongs_to :restaurant
end
