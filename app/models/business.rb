class Business < ActiveRecord::Base

  has_many :locations

  validates :slug, :presence => true, :uniqueness => true
  validates :name, :presence => true

end
