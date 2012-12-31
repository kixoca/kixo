class QuestionVisibilityName < TaxonomyName

  attr_accessible :question_visibility

  # a question visibility name belongs to a question visibility
  belongs_to :question_visibility, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :question_visibility

end
