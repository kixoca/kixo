class TaxonomyName < ActiveRecord::Base

  include CommonScopes

  attr_accessible :name, :locale, :taxonomy

  # a taxonomy name belongs to a taxonomy
  belongs_to :taxonomy

  # a taxonomy name belongs to a locale
  belongs_to :locale

  accepts_nested_attributes_for :locale, :taxonomy

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :taxonomy

end
