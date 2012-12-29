class CreateTaxonomyDescriptions < ActiveRecord::Migration
  def change
    create_table :taxonomy_descriptions do |t|
      t.string  :description
      t.integer :locale_id,   :null => false, :default => 0
      t.integer :taxonomy_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
