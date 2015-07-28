class Event < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :intger
  end
end
