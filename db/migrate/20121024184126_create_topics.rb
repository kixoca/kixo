class CreateTopics < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.string  :name,        :null => false, :default => ""
      t.string  :slug,        :null => false, :default => ""
      t.text    :description
      t.integer :category_id, :null => false, :default => 0
      t.timestamps
    end

    # slug must be unique
    add_index :topics, :slug, :unique => true

    # make translatable
    Topic.create_translation_table! :name => :string, :slug => :string, :description => :text
  end

  def down
    drop_table :topics
    Topic.drop_translation_table!
  end
end
