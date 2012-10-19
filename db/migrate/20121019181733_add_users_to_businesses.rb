class AddUsersToBusinesses < ActiveRecord::Migration
  def up
    add_column :businesses, :user_id, :integer
  end

  def down
    remove_column :businesses, :user_id
  end
end
