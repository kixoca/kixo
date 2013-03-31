class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.references :classifiable, :null => false, :default => 0, :polymorphic => true
      t.references :taxonomy,     :null => false, :default => 0, :polymorphic => true
    end

    add_index :classifications, [:classifiable_id, :classifiable_type, :taxonomy_id, :taxonomy_type], :unique => true, :name => "index_classifiable_taxonomy"
    add_index :classifications, [:taxonomy_id, :taxonomy_type, :classifiable_id, :classifiable_type], :unique => true, :name => "index_taxonomy_classifiable"
  end
end
