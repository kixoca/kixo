class CreateTaxonomyNames < ActiveRecord::Migration
  def change
    create_table :taxonomy_names do |t|
      t.string  :name
      t.integer :locale_id,   :null => false, :default => 0
      t.integer :taxonomy_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
