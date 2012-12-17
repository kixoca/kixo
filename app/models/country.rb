class Country < ActiveRecord::Base
  include CommonScopes

  # a country has many country names (in different locales)
  has_many :country_names

  # a country has many regions (states, provinces, etc.)
  has_many :regions

  # a country has many localities (a.k.a. cities) through regions
  has_many :localities, :through => :regions

  def to_param
    "#{name.parameterize}"
  end

  # search method
  def self.search(term)
    CountryName.search(term).country
  end
end
