class CreateLocalityNames < ActiveRecord::Migration
  def change
    create_table :locality_names do |t|
      t.string  :name,        :null => false, :default => ""
      t.integer :locale_id,   :null => false, :default => 0
      t.integer :locality_id, :null => false, :default => 0
    end
  end
end
