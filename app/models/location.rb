class Location < ActiveRecord::Base

  belongs_to :business

  validates :street_address_1, :presence => true
  validates :locality, :presence => true
  validates :region, :presence => true
  validates :postal_code, :presence => true
  validates :country, :presence => true

end
