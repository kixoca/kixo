class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string  :label,     :null => false, :default => ""
      t.integer :locale_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
