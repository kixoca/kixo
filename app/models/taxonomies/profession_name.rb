class ProfessionName < TaxonomyName
  attr_accessible :profession

  # a profession name belongs to a profession
  belongs_to :profession, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :profession
end
