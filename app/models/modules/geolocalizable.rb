module Geolocalizable
  def self.included(base)
    base.attr_accessible :street_address_1, :street_address_2,
                         :locality, :locality_id,
                         :region, :region_id,
                         :postal_code,
                         :country, :country_id

    base.belongs_to :country
    base.belongs_to :region
    base.belongs_to :locality

    base.geocoded_by :geocoding_address
    base.after_validation :geocode

    def geocoding_address
      addr = Array.new
      addr << self.street_address_1 unless self.street_address_1.blank?
      addr << self.locality.name    unless self.locality.nil?
      addr << self.region.name      unless self.region.nil?
      addr << self.postal_code      unless self.postal_code.blank?
      addr << self.country.name     unless self.country.nil?
      addr.join(" ")
    end

    def base.find_all_by_locality(locality)
      self.where(:conditions => {:locality => {:id => locality}})
    end

    def base.find_all_by_region(region)
      self.where(:conditions => {:region => {:id => region}})
    end

    def base.find_all_by_country(country)
      self.where(:conditions => {:country => {:id => country}})
    end
  end
end