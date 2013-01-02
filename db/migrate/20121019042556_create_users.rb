class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # user type
      t.string :type

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

      # personal information
      t.string  :name
      t.string  :tel

      # bio
      t.text :bio

      # profile picture (headshot)
      t.has_attached_file :headshot

      # contact information
      t.string     :street_address_1
      t.string     :street_address_2
      t.references :locality,        :null => false, :default => 0
      t.references :region,          :null => false, :default => 0
      t.string     :postal_code
      t.references :country,         :null => false, :default => 0

      # localization
      t.references :locale, :null => false, :default => 0

      # geolocation
      t.float :latitude
      t.float :longitude

      # notifications (general)
      t.boolean :notify_of_kixo_news,         :null => false, :default => true
      t.boolean :notify_of_partner_news,      :null => false, :default => true
      t.boolean :notify_of_new_messages,      :null => false, :default => true
      t.boolean :notify_of_answers,           :null => false, :default => true
      t.boolean :notify_of_replies,           :null => false, :default => true
      t.boolean :notify_of_similar_questions, :null => false, :default => false

      # notifications (professionals only)
      t.boolean :notify_of_questions,     :null => false, :default => true
      t.boolean :notify_of_other_answers, :null => false, :default => true

      # referer
      t.references :referer

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  end
end
