class QuestionStatusName < TaxonomyName
  attr_accessible :question_status

  # a question status name belongs to a question status
  belongs_to :question_status, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :question_status
end
