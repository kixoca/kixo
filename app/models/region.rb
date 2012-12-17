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

  def to_param
    "#{name.parameterize}"
  end

  # search method
  def self.search(term)
    RegionName.search(term).region
  end
end
