class Region < Taxonomy
  attr_accessible :country

  # a region (state, province, etc.) belongs to a country
  belongs_to :country, :foreign_key => :parent_id

  # a region has many localities (a.k.a. cities)
  has_many :localities, :foreign_key => :parent_id

  def population
    population = 0
    self.localities.each do |locality|
      population += locality.population
    end
    population
  end
end
