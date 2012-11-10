class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string  :name,        :null => false, :default => ""
      t.string  :slug,        :null => false, :default => ""
      t.text    :description
      t.integer :category_id, :null => false, :default => 0
      t.integer :locale_id,   :null => false, :default => 0
      t.timestamps
    end

    # make slug unique
    add_index :professions, :slug, :unique => true
  end
end
