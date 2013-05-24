class AddPlanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :plan, :string, :null => false, :default => ""
  end
end
