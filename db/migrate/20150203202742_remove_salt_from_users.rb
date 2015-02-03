class RemoveSaltFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :salt
  	rename_column :users, :encrypted, :password
  end
end
