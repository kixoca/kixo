class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :name,       :null => false, :default => ""
      t.string :slug,       :null => false, :default => ""
      t.text   :description
      t.timestamps
    end

    # make slug unique
    add_index :professions, :slug, :unique => true
  end
end
