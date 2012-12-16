class QuestionVisibility < ActiveRecord::Base

  # a question visibility has many question visibility names (in different locales)
  has_many :question_visibility_names

  has_many :questions

end
