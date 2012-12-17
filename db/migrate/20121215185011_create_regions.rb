class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.integer :country_id, :null => false, :default => 0
    end
  end
end
