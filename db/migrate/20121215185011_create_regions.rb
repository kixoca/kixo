class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string  :name,       :null => false, :default => ""
      t.integer :country_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
