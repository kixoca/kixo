class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # devise: authenticable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.boolean :is_active, :null => false, :default => true

      # devise: recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      # devise: rememberable
      t.datetime :remember_created_at

      # devise: trackable
      t.integer  :sign_in_count,     :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.boolean :is_professional, :null => false, :default => false
      t.boolean :is_admin, :null => false, :default => false

      t.integer :points, :null => false, :default => 0

      t.string :name
      t.text :bio

      t.string :company_name

      t.string :tel
      t.string :website

      t.string :twitter
      t.string :facebook
      t.string :google_plus
      t.string :linkedin

      t.has_attached_file :headshot

      t.string     :street_address_1
      t.string     :street_address_2
      t.references :locality,        :null => false, :default => 0
      t.string     :postal_code

      t.float :latitude
      t.float :longitude

      t.references :locale, :null => false, :default => 0

      t.string :stripe_customer_id

      t.boolean :notify_of_kixo_news,         :null => false, :default => true
      t.boolean :notify_of_partner_news,      :null => false, :default => true
      t.boolean :notify_of_new_messages,      :null => false, :default => true
      t.boolean :notify_of_answers,           :null => false, :default => true
      t.boolean :notify_of_replies,           :null => false, :default => true
      t.boolean :notify_of_similar_questions, :null => false, :default => false
      t.boolean :notify_of_questions,         :null => false, :default => true
      t.boolean :notify_of_other_answers,     :null => false, :default => true

      t.references :referer

      t.integer :answers_count,       :null => false, :default => 0
      t.integer :questions_count,     :null => false, :default => 0
      t.integer :comments_count,      :null => false, :default => 0
      t.integer :reviews_count,       :null => false, :default => 0
      t.integer :referrals_count,     :null => false, :default => 0

      t.timestamps
      t.datetime :deleted_at
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  end
end
