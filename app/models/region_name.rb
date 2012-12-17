class RegionName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :region_id

  # a country name belongs to a locale
  belongs_to :locale

  # a country name belongs to a country
  belongs_to :region

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :region

  # search method
  def self.search(term)
    RegionName.all(:conditions => ["name like ?", "%#{term}%"])
  end
end
