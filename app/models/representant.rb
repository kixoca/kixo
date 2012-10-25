class Representant < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :tel, :street_address_1, :street_address_2, :locality, :region, :postal_code, :country,
                  :headshot

  # a representant is associated with many professionals
  has_and_belongs_to_many :professionals

  # a representant is associated with one or many categories
  has_and_belongs_to_many :categories

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # validation
  validates :email, :presence => true
  validates :name,  :presence => true
  validates_existence_of :professionals
  validates_existence_of :categories

end
