class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :kind
      t.integer :default_price, :default => 0
      t.integer :restaurant_id
      t.boolean :status, :default => 1
      t.float :average_star, :default => 5
      t.string :description
      t.timestamps
    end
  end
end
