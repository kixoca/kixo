class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string  :name,        :null => false, :default => ""
      t.string  :slug,        :null => false, :default => ""
      t.text    :description
      t.integer :category_id, :null => false, :default => 0
      t.timestamps
    end

    # slug must be unique
    add_index :topics, :slug, :unique => true
  end
end
