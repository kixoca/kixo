class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :raw_address
      t.string :lat
      t.string :lng
      t.string :street_number
      t.string :route
      t.string :locality
      t.string :administrative_area_level_2
      t.string :administrative_area_level_1
      t.string :country
      t.string :postal_code
      t.timestamps
    end
  end
end