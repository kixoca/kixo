class ProfessionDescription < TaxonomyDescription
  attr_accessible :profession

  # a profession description belongs to a profession
  belongs_to :profession, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :profession
end
