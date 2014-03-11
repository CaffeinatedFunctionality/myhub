class AddUsernameToUser < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	remove_column :users, :alias, :string
  end
end
