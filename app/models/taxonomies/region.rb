class Region < Taxonomy
  attr_accessible :country

  after_save    :expire_cache
  after_destroy :expire_cache

  # a region (state, province, etc.) belongs to a country
  belongs_to :country, :foreign_key => :parent_id

  # a region has many localities (a.k.a. cities)
  has_many :localities, :foreign_key => :parent_id

  has_many :users, :foreign_key => :region_id
  has_many :professionals, :class_name => "User", :foreign_key => :region_id, :conditions => {:is_professional => true}

  geocoded_by :geocoding_address
  after_validation :geocode

  def self.all_cached
    Rails.cache.fetch('Region.all') { all }
  end

  def expire_cache
    Rails.cache.delete('Region.all')
  end

  def population
    population = 0
    self.localities.each do |locality|
      population += locality.population
    end
    population
  end

  def geocoding_address
    "#{self.name}, #{self.country.name}"
  end
end
