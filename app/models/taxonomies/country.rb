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

  def self.find_by_name(name)
    country_name = CountryName.find_by_name(name)
    country = country_name ? country_name.country : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:country_names).where(:conditions => {:country_names => {:name => term, :locale_id => locale}})
  end

end
