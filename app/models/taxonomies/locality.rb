class Locality < Taxonomy
  attr_accessible :region

  # a locality (a.k.a. city) belongs to a region (which belongs to a country in turn)
  belongs_to :region, :foreign_key => :parent_id

  def population
    self.rank
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
end
