class Answer < ActiveRecord::Base
  attr_accessible :details, :question, :question_id, :author, :author_id

  # an answer is associated with a questions
  belongs_to :question, :counter_cache => true

  # an answer is associated with an author
  belongs_to :author, :class_name => "User", :counter_cache => true

  # validation
  validates :details, :presence => true
  validates_existence_of :question
  validates_existence_of :author
end
