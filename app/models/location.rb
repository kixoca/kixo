class Location < ActiveRecord::Base

  # every location is linked to a business
  belongs_to :business

  # make sure the parent business exists
  validates_existence_of :business

  validates :street_address_1, :presence => true
  validates :locality,         :presence => true
  validates :region,           :presence => true
  validates :postal_code,      :presence => true
  validates :country,          :presence => true

end
