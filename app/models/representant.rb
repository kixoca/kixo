class Representant < ActiveRecord::Base

  # a Representant owns many businesses
  has_many :businesses

  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  validates :tel,        :presence => true
  validates :email,      :presence => true

end
