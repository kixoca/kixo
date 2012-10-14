class Location < ActiveRecord::Base

  attr_accessible :business_id, :door_number, :house_number, :street_name,
                  :locality_id, :region_id, :postal_code_id, :country_id,
                  :tel, :fax, :email

  # every location is linked to a business
  belongs_to :business

  has_one :locality,    :class_name => 'Where', :primary_key => :locality_id
  has_one :region,      :class_name => 'Where', :primary_key => :region_id
  has_one :postal_code, :class_name => 'Where', :primary_key => :postal_code_id
  has_one :country,     :class_name => 'Where', :primary_key => :country_id

  # make sure the parent business exists
  validates_existence_of :business

  validates :door_number,     :presence => true
  validates :house_number,    :presence => true
  validates :street_name,     :presence => true
  validates :locality_id,     :presence => true
  validates :region_id,       :presence => true
  validates :postal_code_id,  :presence => true
  validates :country_id,      :presence => true

end
