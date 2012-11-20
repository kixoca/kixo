class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :name, :null => false, :default => ""
      t.timestamps
    end
  end
end
