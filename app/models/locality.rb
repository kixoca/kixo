class Locality < ActiveRecord::Base
  include CommonScopes

  attr_accessible :population, :region_id

  # a locality has many locality names (in different locales)
  has_many :locality_names

  # a locality (a.k.a. city) belongs to a region (which belongs to a country in turn)
  belongs_to :region

  validates_existence_of :region

  def to_param
    "#{name.parameterize}"
  end

  # search method
  def self.search(term)
    LocalityName.search(term).locality
  end
end
