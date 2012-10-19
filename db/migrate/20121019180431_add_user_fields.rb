class AddUserFields < ActiveRecord::Migration
  def up
    add_column :users, :name, :string, :null => false, :default => ""
    add_column :users, :tel, :string
    add_column :users, :door_number, :string
    add_column :users, :house_number, :string
    add_column :users, :street_name, :string
    add_column :users, :locality, :string
    add_column :users, :region, :string
    add_column :users, :postal_code, :string
    add_column :users, :country, :string
  end

  def down
    remove_column :users, :name
    remove_column :users, :tel
    remove_column :users, :door_number
    remove_column :users, :house_number
    remove_column :users, :street_name
    remove_column :users, :locality
    remove_column :users, :region
    remove_column :users, :postal_code
    remove_column :users, :country
  end
end
