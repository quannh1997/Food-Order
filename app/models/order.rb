class Order < ApplicationRecord
  has_secure_token :order_code #https://makandracards.com/alexander-m/39365-generate-unique-random-token
  has_many :order_food
  belongs_to :user
  belongs_to :restaurant
end
