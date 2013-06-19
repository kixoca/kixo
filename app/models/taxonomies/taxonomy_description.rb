class TaxonomyDescription < ActiveRecord::Base
  include Localizable

  attr_accessible :description, :locale, :locale_id, :taxonomy, :taxonomy_id, :taxonomy_type

  # a taxonomy description belongs to a taxonomy
  belongs_to :taxonomy

  # a taxonomy description belongs to a locale
  belongs_to :locale

  # validation
  validates :description, :presence => true
  validates :locale,      :presence => true
  validates :taxonomy,    :presence => true
end
