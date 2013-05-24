class RemoveIsProfessionalFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :is_professional
  end

  def down
    add_column :users, :is_professional, :null => false, :default => false
  end
end
