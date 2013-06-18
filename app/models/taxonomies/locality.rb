class Locality < Taxonomy
  attr_accessible :region

  after_save    :expire_cache
  after_destroy :expire_cache

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

  def self.all_cached
    Rails.cache.fetch('Locality.all') { all }
  end

  def self.most_popular_cached(n = 10)
    Rails.cache.fetch("Locality.most_popular(#{n})") { order("questions_count DESC, users_count DESC").limit(n) }
  end

  def expire_cache
    Rails.cache.delete('Locality.all')
  end
end
