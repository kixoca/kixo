class Business < ActiveRecord::Base

  validates :slug, :presence => true, :uniqueness => true
  validates :name, :presence => true

end
