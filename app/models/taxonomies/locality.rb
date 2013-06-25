class Locality < Taxonomy
  attr_accessible :region

  # a locality (a.k.a. city) belongs to a region (which belongs to a country in turn)
  belongs_to :region, :foreign_key => :parent_id

  has_many :users, :foreign_key => :locality_id
  has_many :professionals, :class_name => "User", :foreign_key => :locality_id, :conditions => {:is_professional => true}

  geocoded_by :geocoding_address
  after_validation :geocode

  def population
    self.rank
  end

  def geocoding_address
    "#{self.name}, #{self.region.name}, #{self.region.country.name}"
  end

  def self.sort_by_population
    self.sort_by(&:population)
  end

  def self.order_by_population
    self.order_by_rank
  end

  def self.most_populated(n = 10)
    self.order_by_population.limit(n)
  end

  def self.most_popular(n = 10)
    self.order("questions_count DESC, users_count DESC, rank DESC").limit(n)
  end
end
