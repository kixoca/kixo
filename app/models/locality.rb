class Locality < ActiveRecord::Base
  include CommonScopes

  attr_accessible :population, :region_id

  # a locality has many locality names (in different locales)
  has_many :locality_names

  # a locality (a.k.a. city) belongs to a region (which belongs to a country in turn)
  belongs_to :region

  validates_existence_of :region

  def name(locale = nil)
    self.locality_names.by_locale(locale).first.name
  end

  def self.find_by_name(name)
    LocalityName.find_by_name(name).locality
  end

  def self.search(term, locale = nil)
    localities = Array.new
    LocalityName.by_locale(locale).search(term).each do |locality_name|
      localities << locality_name.locality
    end
    localities
  end

  def to_param
    "#{self.name.parameterize}"
  end
end
