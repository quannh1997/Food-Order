class Order < ApplicationRecord
  has_secure_token :code #https://makandracards.com/alexander-m/39365-generate-unique-random-token
  self.table_name = "orders"
  has_many :order_food
  belongs_to :user
  # belongs_to :restaurant
  has_and_belongs_to_many :restaurants
end
