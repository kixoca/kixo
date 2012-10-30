class CreateLocales < ActiveRecord::Migration
  def change
    create_table :locales do |t|
      t.string :name, :null => false, :default => ""
      t.string :code, :null => false, :default => ""
      t.timestamps
    end

    add_index :locales, :code, :unique => true
  end
end
