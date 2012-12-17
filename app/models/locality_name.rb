class LocalityName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :locality_id

  # a country name belongs to a locale
  belongs_to :locale

  # a country name belongs to a country
  belongs_to :locality

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :locality

  def self.search(term, locale = nil)
    LocalityName.by_locale(locale).all(:conditions => ["name like ?", "%#{term}%"])
  end
end
