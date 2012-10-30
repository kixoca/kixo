class CreateLocales < ActiveRecord::Migration
  def up
    create_table :locales do |t|
      t.string :name, :null => false, :default => ""
      t.string :code, :null => false, :default => ""
      t.timestamps
    end

    # code must be unique
    add_index :locales, :code, :unique => true

    # make translatable
    Locale.create_translation_table! :name => :string
  end

  def down
    drop_table :locales
    Locale.drop_translation_table!
  end
end
