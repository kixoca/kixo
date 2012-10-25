class Answer < ActiveRecord::Base

  attr_accessible :details, :question_id, :professional_id

  # an answer is associated with a question
  belongs_to :question

  # an answer is associated with a professional
  belongs_to :professional

  # validation
  validates :details, :presence => true
  validates_existence_of :question
  validates_existence_of :professional

end
