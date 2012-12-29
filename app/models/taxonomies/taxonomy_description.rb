class TaxonomyDescription < ActiveRecord::Base
  include CommonScopes

  attr_accessible :description, :locale_id, :taxonomy_id

  # a taxonomy description belongs to a locale
  belongs_to :locale

  # a taxonomy description belongs to a taxonomy
  belongs_to :taxonomy

  # validation
  validates :description, :presence => true
  validates_existence_of :locale
  validates_existence_of :taxonomy
end
