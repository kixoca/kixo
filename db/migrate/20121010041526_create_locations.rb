class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street_address_1
      t.string :street_address_2
      t.string :locality
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :tel
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
