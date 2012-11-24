class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :name,       :null => false
      t.text    :description
      t.integer :locale_id,  :null => false, :default => 0
      t.timestamps
    end

    # slug must be unique
    add_index :categories, :slug, :unique => true
  end
end
