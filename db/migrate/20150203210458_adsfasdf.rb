class Adsfasdf < ActiveRecord::Migration
  	def change
  		remove_column :users, :salt
  		rename_column :users, :password_hash, :password_digest
 	end
end
