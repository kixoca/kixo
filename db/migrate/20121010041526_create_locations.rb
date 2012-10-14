class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :business_id
      t.string  :door_number
      t.string  :house_number,     :null => false
      t.string  :street_name,      :null => false
      t.string  :locality_id,      :null => false
      t.string  :region_id,        :null => false
      t.string  :postal_code_id,   :null => false
      t.string  :country_id,       :null => false
      t.string  :tel
      t.string  :fax
      t.string  :email

      t.timestamps
    end
  end
end
