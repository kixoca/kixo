class QuestionStatus < ActiveRecord::Base

  # a question status has many question status names (in different locales)
  has_many :question_status_names

  has_many :questions

end
