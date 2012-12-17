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
    RegionName.find_by_name(name).region
  end

  def self.search(term, locale = nil)
    regions = Array.new
    RegionName.by_locale(locale).search(term).each do |region_name|
      regions << region_name.region
    end
    regions
  end

  # customize url
  def to_param
    "#{self.name.parameterize}"
  end
end
