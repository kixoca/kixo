class Business < ActiveRecord::Base

  # a business can have many locations (physical addresses)
  has_many :locations

  validates :slug, :presence => true, :uniqueness => true
  validates :name, :presence => true

end
