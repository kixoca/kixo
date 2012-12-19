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

  def self.search(term, locale = nil)
    regions = Array.new
    RegionName.by_locale(locale).search(term).each do |region_name|
      regions << region_name.region
    end
    regions
  end

  def self.population
    population = 0
    self.localities.each do |locality|
      population += locality.population
    end
    population
  end

  # customize url
  def to_param
    "#{self.name.parameterize}"
  end
end
