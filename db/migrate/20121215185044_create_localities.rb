class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.integer :population
      t.integer :region_id, :null => false, :default => 0
    end
  end
end
