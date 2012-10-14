class CreateWheres < ActiveRecord::Migration
  def change
    create_table :wheres do |t|
      t.string :value
      t.string :level

      t.timestamps
    end
  end
end
