class GuideStatusName < TaxonomyName
  attr_accessible :guide_status

  # a guide status name belongs to a guide status
  belongs_to :guide_status, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :guide_status
end
