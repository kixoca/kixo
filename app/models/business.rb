class Business < ActiveRecord::Base

  # a business can have many locations (physical addresses)
  has_many :locations, :dependent => :destroy

  validates :slug, :presence => true, :uniqueness => true
  validates :name, :presence => true

end
