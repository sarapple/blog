class Renamecolumn < ActiveRecord::Migration
  def change
  	rename_column :users, :password_digest, :password_hash
    add_column :users, :salt, :string
  end
end
