class Country < Taxonomy
  # a country has many regions (states, provinces, etc.)
  has_many :regions, :foreign_key => :parent_id

  # a country has many localities (a.k.a. cities) through regions
  has_many :localities, :through => :regions

  def population
    population = 0
    self.regions.each do |region|
      population += region.population
    end
    population
  end
end
