class Answer < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :answer, :question, :question_id, :author, :author_id, :deleted_at

  # an answer is associated with a questions
  belongs_to :question, :counter_cache => true

  # an answer is associated with an author
  belongs_to :author, :class_name => "User", :counter_cache => true

  # an answer can have one or many comments
  has_many :comments, :as => :commentable

  # validation
  validates :answer,   :presence => true
  validates :question, :presence => true
  validates :author,   :presence => true
end
