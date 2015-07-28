class Users < ActiveRecord::Migration
  def change
    rename_column :users, :provider_hash, :username
  end
end
