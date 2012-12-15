class Locality < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :region_id

  # a locality (a.k.a. city) belongs to a region (which belongs to a country in turn)
  belongs_to :region

  validates :name, :presence => true
  validates_existence_of :region

  def to_param
    "#{name.parameterize}"
  end
end
