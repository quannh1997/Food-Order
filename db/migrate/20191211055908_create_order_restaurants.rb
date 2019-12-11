class CreateOrderRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :order_restaurants do |t|
      t.references :order, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
