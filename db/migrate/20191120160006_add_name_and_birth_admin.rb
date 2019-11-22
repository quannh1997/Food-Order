class AddNameAndBirthAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :name, :string
    add_column :admins, :birth, :date
    add_index :admins, :name, unique: true
  end
end
