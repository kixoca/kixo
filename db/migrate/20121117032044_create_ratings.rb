class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :name, :null => false, :default => ""
    end

    add_index :ratings, :name, :unique => true
  end
end
