class Country < ActiveRecord::Base
  include CommonScopes

  # a country has many country names (in different locales)
  has_many :country_names

  # a country has many regions (states, provinces, etc.)
  has_many :regions

  # a country has many localities (a.k.a. cities) through regions
  has_many :localities, :through => :regions

  def name(locale = nil)
    self.country_names.by_locale(locale).first.name
  end

  def self.find_by_name(name)
    CountryName.find_by_name(name).country
  end

  def self.search(term, locale = nil)
    countries = Array.new
    CountryName.by_locale(locale).search(term).each do |country_name|
      countries << country_name.country
    end
    countries
  end

  def to_param
    "#{self.name.parameterize}"
  end
end
