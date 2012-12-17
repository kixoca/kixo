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

  # search method
  def self.search(term)
    LocalityName.all(:conditions => ["name like ?", "%#{term}%"])
  end
end
