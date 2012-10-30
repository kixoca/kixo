class CreateProfessions < ActiveRecord::Migration
  def up
    create_table :professions do |t|
      t.string :name,       :null => false, :default => ""
      t.string :slug,       :null => false, :default => ""
      t.text   :description
      t.timestamps
    end

    # make slug unique
    add_index :professions, :slug, :unique => true

    # make translatable
    Profession.create_translation_table! :name => :string, :slug => :string, :description => :text
  end

  def down
    drop_table :professions
    Profession.drop_translation_table!
  end
end
