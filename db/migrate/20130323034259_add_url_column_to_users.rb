class AddUrlColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :url, :string
  end
end
