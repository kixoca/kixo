class CreateLocalizations < ActiveRecord::Migration
  def change
    create_table :localizations do |t|
      t.references :localizable, :null => false, :default => 0, :polymorphic => true
      t.references :locale,      :null => false, :default => 0
    end

    add_index :localizations, [:localizable_id, :localizable_type, :locale_id], :unique => true, :name => "index_localizable_locale"
    add_index :localizations, [:locale_id, :localizable_id, :localizable_type], :unique => true, :name => "index_locale_localizable"
  end
end
