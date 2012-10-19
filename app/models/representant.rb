class Representant < ActiveRecord::Base

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me
                  :name, :tel,
                  :door_number, :house_number, :street_name,
                  :locality, :region, :postal_code, :country,
                  :business_ids

  # a Representant owns many businesses
  has_many :businesses

  validates :name,  :presence => true
  validates :tel,   :presence => true
  validates :email, :presence => true

end
