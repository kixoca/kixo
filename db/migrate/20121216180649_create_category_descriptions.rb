class CreateCategoryDescriptions < ActiveRecord::Migration
  def change
    create_table :category_descriptions do |t|
      t.string  :description, :null => false, :default => ""
      t.integer :locale_id,   :null => false, :default => 0
      t.integer :category_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
