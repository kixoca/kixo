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

    base.validates_existence_of :locality
    base.validates_existence_of :region
    base.validates_existence_of :country

    base.geocoded_by :full_address
    base.after_validation :geocode

    def base.short_address
      "#{self.locality.name}, #{self.region.name}"
    end

    def base.full_address
      "#{self.locality.name}, #{self.region.name} #{self.postal_code}, #{self.country.name}"
    end

    def base.find_by_locality(locality)
      self.where(:conditions => {:locality => {:id => locality}})
    end

    def base.find_by_region(region)
      self.where(:conditions => {:region => {:id => region}})
    end

    def base.find_by_country(country)
      self.where(:conditions => {:country => {:id => country}})
    end
  end
end