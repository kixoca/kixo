class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
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
      t.string :provider
      t.string :uid

      # personal information
      t.string :name,            :null => false, :default => ""
      t.string :tel
      t.string :street_address_1
      t.string :street_address_2
      t.string :locality,        :null => false, :default => ""
      t.string :region,          :null => false, :default => ""
      t.string :postal_code
      t.string :country

      # profile picture (headshot)
      t.has_attached_file :headshot

      t.timestamps
    end

    add_index :professionals, :email,                :unique => true
    add_index :professionals, :reset_password_token, :unique => true
  end
end
