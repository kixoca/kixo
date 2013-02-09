class Region < Taxonomy
  attr_accessible :country

  # a region (state, province, etc.) belongs to a country
  belongs_to :country, :foreign_key => :parent_id

  # a region has many localities (a.k.a. cities)
  has_many :localities, :foreign_key => :parent_id

  has_many :users, :foreign_key => :region_id
  has_many :professionals, :class_name => "User", :foreign_key => :region_id, :conditions => {:is_a_professional => true}

  geocoded_by :geocoding_address
  after_validation :geocode

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
