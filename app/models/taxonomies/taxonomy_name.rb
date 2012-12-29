class TaxonomyName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :taxonomy_id

  # a taxonomy name belongs to a locale
  belongs_to :locale

  # a taxonomy name belongs to a taxonomy
  belongs_to :taxonomy

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :taxonomy
end
