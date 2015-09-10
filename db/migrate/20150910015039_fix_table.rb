class FixTable < ActiveRecord::Migration

  def change
    add_column :users, :email, :string, null: false
    add_column :users, :created_at, :datetime 
    add_column :users, :updated_at, :datetime
    add_index :users, [:email], unique: true 
	end
end

