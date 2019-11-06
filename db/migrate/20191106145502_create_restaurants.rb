class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :average_star
      t.integer :selected_count
      t.string :address

      t.timestamps
    end
  end
end
