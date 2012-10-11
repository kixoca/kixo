class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street_address_1, :null => false
      t.string :street_address_2
      t.string :locality, :null => false
      t.string :region, :null => false
      t.string :postal_code, :null => false
      t.string :country, :null => false
      t.string :tel
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
