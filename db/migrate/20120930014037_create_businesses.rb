class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string  :slug,           :null => false
      t.string  :name,           :null => false
      t.string  :tel
      t.string  :fax
      t.string  :email
      t.string  :url
      t.text    :description
      t.string  :facebook_url
      t.string  :twitter_url
      t.string  :linkedin_url
      t.timestamps
    end
  end
end
