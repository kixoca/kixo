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

  # find a region by name
  def self.find_by_name(name)
    region_name = RegionName.find_by_name(name)
    region = region_name ? region_name.region : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:region_names).where(:conditions => {:region_names => {:name => term, :locale_id => locale}})
  end
end
