class Location < ActiveRecord::Base

  attr_accessible :business_id, :door_number, :house_number, :street_name, :locality,
                  :region, :postal_code, :country, :tel, :fax, :email

  # every location is linked to a business
  belongs_to :business

  # make sure the parent business exists
  validates_existence_of :business

  validates :house_number, :presence => true
  validates :street_name,  :presence => true
  validates :locality,     :presence => true
  validates :region,       :presence => true
  validates :postal_code,  :presence => true
  validates :country,      :presence => true

end
