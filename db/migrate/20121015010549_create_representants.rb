class CreateRepresentants < ActiveRecord::Migration
  def change
    create_table :representants do |t|
      t.string :name,  :null => false
      t.string :tel,   :null => false
      t.string :email, :null => false

      t.timestamps
    end
  end
end
