class RatingName < TaxonomyName

  attr_accessible :rating

  # a rating name belongs to a rating
  belongs_to :rating, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :rating

end
