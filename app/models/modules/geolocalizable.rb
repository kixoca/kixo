module Geolocalizable
  def self.included(base)
    base.geocoded_by :geocoding_address
    #base.after_validation :geocode

    def geocoding_address
      addr = Array.new
      addr << street_address_1             unless !self.respond_to?('street_address_1') or street_address_1.nil? or street_address_1.blank?
      addr << locality.name                unless locality.nil?
      addr << locality.region.name         unless locality.nil? or locality.region.nil?
      addr << postal_code                  unless !self.respond_to?('postal_code') or postal_code.nil? or postal_code.blank?
      addr << locality.region.country.name unless locality.nil? or locality.region.nil? or locality.region.country.nil?
      addr.join(" ")
    end

    def base.find_all_by_locality(locality)
      self.where(:locality_id => locality)
    end

    def base.find_all_by_region(region)
      self.where(:region_id => region)
    end

    def base.find_all_by_country(country)
      self.where(:country_id => country)
    end

    def locality_name
      self.locality.name unless self.locality.nil?
    end
  end
end