class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string  :name,        :null => false, :default => ""
      t.text    :description
      t.integer :category_id, :null => false, :default => 0
      t.integer :locale_id,   :null => false, :default => 0
      t.timestamps
    end
  end
end
