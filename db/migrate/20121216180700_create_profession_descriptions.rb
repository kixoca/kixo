class CreateProfessionDescriptions < ActiveRecord::Migration
  def change
    create_table :profession_descriptions do |t|
      t.string  :description,   :null => false, :default => ""
      t.integer :locale_id,     :null => false, :default => 0
      t.integer :profession_id, :null => false, :default => 0
    end
  end
end
