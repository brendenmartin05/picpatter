class AddUserRefToEvents < ActiveRecord::Migration
  def change
    add_foreign_key :events, :users, index: true
  end
end
