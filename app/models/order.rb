class Order < ApplicationRecord
  belongs_to :user
  has_many :order_restaurant
  has_many :order_food
end
