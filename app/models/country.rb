class Country < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name

  # a country has many regions (states, provinces, etc.)
  has_many :regions

  # a country has many localities (a.k.a. cities) through regions
  has_many :localities, :through => :regions

  validates :name, :presence => true

  def to_param
    "#{name.parameterize}"
  end
end
