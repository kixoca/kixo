class Answer < ActiveRecord::Base

  attr_accessible :details, :question_id, :professional_id

  # an answer is associated with a questions
  belongs_to :question

  # an answer is associated with a professional
  belongs_to :professional

  # track versions with paper trail
  has_paper_trail

  # validation
  validates :details, :presence => true
  validates_existence_of :questions
  validates_existence_of :professional

end
