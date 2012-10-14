class CreateWheres < ActiveRecord::Migration
  def change
    create_table :wheres do |t|
      t.string :value, :null => false
      t.string :level, :null => false

      t.timestamps
    end
  end
end
