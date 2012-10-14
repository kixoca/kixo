class Location < ActiveRecord::Base

  # every location is linked to a business
  belongs_to :business

  # make sure the parent business exists
  validates_existence_of :business

  # street, locality, region, postal code and country
  # are stored in the Where model
  has_one :locality,    :class_name => "Where", :foreign_key => "locality_id"
  has_one :region,      :class_name => "Where", :foreign_key => "region_id"
  has_one :postal_code, :class_name => "Where", :foreign_key => "postal_code_id"
  has_one :country,     :class_name => "Where", :foreign_key => "country_id"

  validates :door_number,     :presence => true
  validates :house_number,    :presence => true
  validates :street_name,     :presence => true
  validates :locality_id,     :presence => true
  validates :region_id,       :presence => true
  validates :postal_code_id,  :presence => true
  validates :country_id,      :presence => true

end
