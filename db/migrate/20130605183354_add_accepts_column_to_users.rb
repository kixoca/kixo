class AddAcceptsColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :accepts, :boolean, :null => false, :default => false
  end
end
