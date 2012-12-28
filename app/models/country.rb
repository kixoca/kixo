class Country < ActiveRecord::Base
  include CommonScopes

  # a country has many country names (in different locales)
  has_many :country_names

  # a country has many regions (states, provinces, etc.)
  has_many :regions

  # a country has many localities (a.k.a. cities) through regions
  has_many :localities, :through => :regions

  # a country has many professionals
  has_many :professionals

  def name(locale = nil)
    self.country_names.by_locale(locale).first.name
  end

  def self.find_by_name(name)
    country_name = CountryName.find_by_name(name)
    country = country_name ? country_name.country : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:country_names).where(:conditions => {:country_names => {:name => term, :locale_id => locale}})
  end

  def population
    population = 0
    self.regions.each do |region|
      population += region.population
    end
    population
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
