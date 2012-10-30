class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string  :name,       :null => false
      t.string  :slug,       :null => false
      t.text    :description
      t.timestamps
    end

    # slug must be unique
    add_index :categories, :slug, :unique => true

    # make translatable
    Category.create_translation_table! :name => :string, :slug => :string, :description => :text
  end

  def down
    drop_table :categories
    Category.drop_translation_table!
  end
end
