class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :category_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
