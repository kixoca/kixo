class Answer < ActiveRecord::Base
  attr_accessible :details, :question, :question_id, :author, :author_id

  # an answer is associated with a questions
  belongs_to :question

  # an answer is associated with an author
  belongs_to :author

  # validation
  validates :details, :presence => true
  validates_existence_of :question
  validates_existence_of :author
end
