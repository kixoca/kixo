class AddIndexOnTaxonomyDescriptions < ActiveRecord::Migration
  def change
    add_index :taxonomy_descriptions, [:taxonomy_id, :locale_id]
  end
end
