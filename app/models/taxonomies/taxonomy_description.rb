class TaxonomyDescription < ActiveRecord::Base
  include Localizable

  attr_accessible :description, :taxonomy, :taxonomy_id

  # a taxonomy description belongs to a taxonomy
  belongs_to :taxonomy

  # a taxonomy description belongs to a locale
  belongs_to :locale

  # validation
  validates :description, :presence => true
  validates_existence_of :locale
  validates_existence_of :taxonomy
end
