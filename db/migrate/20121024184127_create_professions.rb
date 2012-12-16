class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.integer :category_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
