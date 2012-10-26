class Professional < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid,
                  :name, :tel, :street_address_1, :street_address_2, :locality, :region, :postal_code, :country,
                  :headshot

  # a professional is associated with one or many categories
  has_and_belongs_to_many :categories

  # a professional is associated with one or many topics
  has_and_belongs_to_many :topics

  # a professional is associated with one or many professions
  has_and_belongs_to_many :professions

  # a professional can be the author of one or many guides
  has_many :guides

  # a professional can have one or many answers
  has_many :answers

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # validation
  validates :email,    :presence => true
  validates :name,     :presence => true
  validates :locality, :presence => true
  validates :region,   :presence => true
  validates :country,  :presence => true
  validates_existence_of :categories
  validates_existence_of :topics
  validates_existence_of :professions

end
