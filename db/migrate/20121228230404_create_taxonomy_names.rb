class CreateTaxonomyNames < ActiveRecord::Migration
  def change
    create_table :taxonomy_names do |t|
      t.string     :type
      t.string     :name
      t.references :locale,   :null => false, :default => 0
      t.references :taxonomy, :null => false, :default => 0
    end
  end
end
