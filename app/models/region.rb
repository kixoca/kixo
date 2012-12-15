class Region < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :country_id

  # a region (state, province, etc.) belongs to a country
  belongs_to :country

  # a region has many localities (a.k.a. cities)
  has_many :localities

  validates :name, :presence => true
  validates_existence_of :country

  def to_param
    "#{name.parameterize}"
  end
end
