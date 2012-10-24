class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string  :slug,       :null => false
      t.string  :name,       :null => false
      t.text    :description
      t.integer :category_id
      t.timestamps
    end
  end
end
