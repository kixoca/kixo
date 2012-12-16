class CreateCategoryNames < ActiveRecord::Migration
  def change
    create_table :category_names do |t|
      t.string  :name,        :null => false, :default => ""
      t.integer :locale_id,   :null => false, :default => 0
      t.integer :category_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
