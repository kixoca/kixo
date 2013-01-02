class Answer < ActiveRecord::Base
  attr_accessible :details, :question, :question_id, :author, :author_id

  # an answer is associated with a questions
  belongs_to :question

  # an answer is associated with a professional
  belongs_to :author, :polymorphic => true

  # validation
  validates :details, :presence => true
  validates_existence_of :question
  validates_existence_of :author
end
