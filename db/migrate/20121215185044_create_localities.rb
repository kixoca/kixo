class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.string  :name,       :null => false, :default => ""
      t.integer :population
      t.integer :region_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
