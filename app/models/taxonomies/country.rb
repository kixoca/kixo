class Country < Taxonomy
  # a country has many regions (states, provinces, etc.)
  has_many :regions, :foreign_key => :parent_id

  # a country has many localities (a.k.a. cities) through regions
  has_many :localities, :through => :regions

  has_many :users, :foreign_key => :country_id
  has_many :professionals, :class_name => "User", :foreign_key => :country_id, :conditions => {:is_professional => true}

  has_many :questions, :through => :users

  geocoded_by :geocoding_address
  after_validation :geocode

  def population
    population = 0
    self.regions.each do |region|
      population += region.population
    end
    population
  end

  def geocoding_address
    "#{self.name}"
  end
end
