class Address < ActiveRecord::Base
  attr_accessible :raw_address, :lat, :lng, :street_number, :route, :locality, :administrative_area_level_2,
                  :administrative_area_level_1, :country, :postal_code, :type, :addressable

  validates_presence_of :raw_address
end
