class CreateRatingNames < ActiveRecord::Migration
  def change
    create_table :rating_names do |t|
      t.string  :name,      :null => false, :default => ""
      t.integer :locale_id, :null => false, :default => 0
      t.integer :rating_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
