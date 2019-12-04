class Order < ApplicationRecord
  has_many :order_food
  belongs_to :user
  belongs_to :restaurant
end
