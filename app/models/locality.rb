class Locality < ActiveRecord::Base
  include CommonScopes

  attr_accessible :population, :region_id

  # a locality has many locality names (in different locales)
  has_many :locality_names

  # a locality (a.k.a. city) belongs to a region (which belongs to a country in turn)
  belongs_to :region

  # a locality has many professionals
  has_many :professionals

  validates_existence_of :region

  def name(locale = nil)
    self.locality_names.by_locale(locale).first.name
  end

  def self.find_by_name(name)
    locality_name = LocalityName.find_by_name(name)
    locality = locality_name ? locality_name.locality : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:locality_names).where(:conditions => {:locality_names => {:name => term, :locale_id => locale}})
  end

  def self.sort_by_name
    self.sort_by(&:name)
  end

  def self.sort_by_population
    self.order("population DESC")
  end

  def self.most_populated(n = 10)
    self.sort_by_population.limit(n)
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
