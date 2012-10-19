class User < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :provider, :uid,
                  :name, :tel,
                  :door_number, :house_number, :street_name,
                  :locality, :region, :postal_code, :country

  validates :name, :presence => true

  # a user can own many businesses
  has_many :businesses

end
