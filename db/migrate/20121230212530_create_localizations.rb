class CreateLocalizations < ActiveRecord::Migration
  def change
    create_table :localizations, :id => false do |t|
      t.references :localizable, :null => false, :default => 0, :polymorphic => true
      t.references :locale,      :null => false, :default => 0
    end

    add_index :localizations, [:localizable_id, :locale_id]
    add_index :localizations, [:locale_id, :localizable_id]
  end
end
