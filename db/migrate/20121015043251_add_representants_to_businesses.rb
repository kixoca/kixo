class AddRepresentantsToBusinesses < ActiveRecord::Migration
  def up
    add_column :businesses, :representant_id, :integer
  end

  def down
    remove_column :businesses, :representant_id
  end
end
