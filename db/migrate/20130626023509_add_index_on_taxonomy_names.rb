class AddIndexOnTaxonomyNames < ActiveRecord::Migration
  def change
    add_index :taxonomy_names, [:taxonomy_id, :locale_id]
  end
end
