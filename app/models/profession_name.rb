class ProfessionName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :profession_id

  # a profession name belongs to a locale
  belongs_to :locale

  # a profession name belongs to a profession
  belongs_to :profession

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :profession

  # search method
  def self.search(term)
    ProfessionName.all(:conditions => ["name like ?", "%#{term}%"])
  end
end
