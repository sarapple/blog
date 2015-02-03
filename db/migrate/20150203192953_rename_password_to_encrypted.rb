class RenamePasswordToEncrypted < ActiveRecord::Migration
  def change
  	rename_column :users, :password, :encrypted
  end
end
