class OrderFood < ApplicationRecord
  self.table_name = "food_orders"
  belongs_to :food
  belongs_to :order
end
