class LocalityName < TaxonomyName
  attr_accessible :locality

  # a locality name belongs to a locality
  belongs_to :locality, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :locality
end
