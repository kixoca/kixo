class Region < ActiveRecord::Base
  include CommonScopes

  attr_accessible :country_id

  # a region has many region names (in different locales)
  has_many :region_names

  # a region (state, province, etc.) belongs to a country
  belongs_to :country

  # a region has many localities (a.k.a. cities)
  has_many :localities

  validates_existence_of :country

  # name (by locale)
  def name(locale = nil)
    self.region_names.by_locale(locale).first.name
  end

  # find a region by name
  def self.find_by_name(name)
    region_name = RegionName.find_by_name(name)
    region = region_name ? region_name.region : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:region_names).where(:conditions => {:region_names => {:name => term, :locale_id => locale}})
  end

  def self.population
    population = 0
    self.localities.each do |locality|
      population += locality.population
    end
    population
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
