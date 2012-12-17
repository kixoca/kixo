class QuestionStatusName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :question_status_id

  # a question status name belongs to a locale
  belongs_to :locale

  # a question status name belongs to a question status
  belongs_to :question_status

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :question_status
end
