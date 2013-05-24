class AddIsProfessionalToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_professional, :boolean, :null => false, :default => false
  end
end
