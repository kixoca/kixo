class CreateRepresentants < ActiveRecord::Migration
  def change
    create_table :representants do |t|
      # authenticable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      # recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      # rememberable
      t.datetime :remember_created_at

      # trackable
      t.integer  :sign_in_count,     :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # facebook auth
      # t.string :provider
      # t.string :uid

      # personal information
      t.string  :name,            :null => false, :default => ""
      t.string  :tel
      t.string  :street_address_1
      t.string  :street_address_2
      t.integer :locality_id
      t.integer :region_id
      t.string  :postal_code
      t.integer :country_id

      # profile picture (headshot)
      t.has_attached_file :headshot

      # geolocation
      t.float :latitude
      t.float :longitude

      #I18n
      t.integer :locale_id, :null => false, :default => 0

      t.timestamps
    end

    add_index :representants, :email,                :unique => true
    add_index :representants, :reset_password_token, :unique => true
  end
end
