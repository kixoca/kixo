class ProfessionDescription < ActiveRecord::Base
  include CommonScopes

  attr_accessible :description, :locale_id, :category_id

  # a profession description belongs to a locale
  belongs_to :locale

  # a profession description belongs to a profession
  belongs_to :profession

  # validation
  validates :description, :presence => true
  validates_existence_of :locale
  validates_existence_of :profession
end
