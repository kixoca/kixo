class TaxonomyDescription < ActiveRecord::Base
  include Localizable

  attr_accessible :description, :locale, :locale_id, :taxonomy, :taxonomy_id, :taxonomy_type

  # a taxonomy description belongs to a taxonomy
  belongs_to :taxonomy, :inverse_of => :descriptions

  # a taxonomy description belongs to a locale
  belongs_to :locale

  # validation
  validates :description, :presence => true
  validates_existence_of :locale,   :both => false
  validates_existence_of :taxonomy, :both => false
end
