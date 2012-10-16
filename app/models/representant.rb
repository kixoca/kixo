class Representant < ActiveRecord::Base

  attr_accessible :name, :tel, :email

  # a Representant owns many businesses
  has_many :businesses

  validates :name,  :presence => true
  validates :tel,   :presence => true
  validates :email, :presence => true

end
