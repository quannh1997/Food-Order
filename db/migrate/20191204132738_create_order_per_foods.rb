class CreateOrderPerFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :order_per_foods do |t|
      t.references :food, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
