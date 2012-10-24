class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :slug,       :null => false
      t.string  :name,       :null => false
      t.text    :description
      t.timestamps
    end
  end
end
