class TaxonomyName < ActiveRecord::Base
  include Localizable

  attr_accessible :name, :taxonomy, :taxonomy_id

  # a taxonomy name belongs to a taxonomy
  belongs_to :taxonomy

  # a taxonomy name belongs to a locale
  belongs_to :locale

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :taxonomy
end
