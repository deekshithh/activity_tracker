class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :emp_id, :string
    add_column :users, :designation, :string
    add_column :users, :role, :string
  end
end
