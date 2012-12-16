class CreateProfessionNames < ActiveRecord::Migration
  def change
    create_table :profession_names do |t|
      t.string  :name,          :null => false, :default => ""
      t.integer :locale_id,     :null => false, :default => 0
      t.integer :profession_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
