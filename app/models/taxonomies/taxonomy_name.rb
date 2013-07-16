class TaxonomyName < ActiveRecord::Base
  include Localizable

  attr_accessible :name, :locale, :locale_id, :taxonomy, :taxonomy_id, :taxonomy_type

  # a taxonomy name belongs to a taxonomy
  belongs_to :taxonomy, :inverse_of => :names

  # a taxonomy name belongs to a locale
  belongs_to :locale

  # validation
  validates :name, :presence => true
  validates_existence_of :locale,   :both => false
  validates_existence_of :taxonomy, :both => false
end
