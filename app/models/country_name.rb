class CountryName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :country_id

  # a country name belongs to a locale
  belongs_to :locale

  # a country name belongs to a country
  belongs_to :country

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :country

  # search method
  def self.search(term)
    CountryName.all(:conditions => ["name like ?", "%#{term}%"])
  end
end
