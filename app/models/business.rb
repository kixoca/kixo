class Business < ActiveRecord::Base

  attr_accessible :slug, :name, :tel, :fax, :email, :url, :logo, :description,
                  :facebook_url, :twitter_url, :linkedin_url

  # a business can have many locations (physical addresses)
  has_many :locations, :dependent => :destroy

  validates :slug, :presence => true, :uniqueness => true
  validates :name, :presence => true

end
