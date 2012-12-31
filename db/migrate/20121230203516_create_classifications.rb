class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications, :id => false do |t|
      t.references :classifiable, :null => false, :default => 0, :polymorphic => true
      t.references :taxonomy,     :null => false, :default => 0, :polymorphic => true
    end

    add_index :classifications, [:classifiable_id, :taxonomy_id]
    add_index :classifications, [:taxonomy_id, :classifiable_id]
  end
end
