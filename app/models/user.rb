class User < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid,
                  :name, :tel, :street_address_1, :street_address_2, :locality, :region, :postal_code, :country,
                  :headshot

  # a user can have many questions
  has_many :questions

  # a user can be the author of many reviews
  has_many :reviews

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
