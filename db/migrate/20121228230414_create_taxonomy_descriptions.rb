class CreateTaxonomyDescriptions < ActiveRecord::Migration
  def change
    create_table :taxonomy_descriptions do |t|
      t.string     :type
      t.string     :description
      t.references :locale,     :null => false, :default => 0
      t.references :taxonomy,   :null => false, :default => 0
    end
  end
end
