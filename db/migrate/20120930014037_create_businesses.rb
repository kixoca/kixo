class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :slug, :null => false
      t.string :name, :null => false
      t.string :tel
      t.string :fax
      t.string :email
      t.string :url
      t.string :street_address_1
      t.string :street_address_2
      t.string :locality
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :logo
      t.string :facebook_url
      t.string :twitter_url
      t.string :linkedin_url

      t.timestamps
    end
  end
end
