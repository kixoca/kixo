class QuestionVisibility < ActiveRecord::Base

  # a question visibility has many question visibility names (in different locales)
  has_many :question_visibility_names

  has_many :questions

  def name(locale = nil)
    self.question_visibility_names.by_locale(locale).first.name
  end

  def self.find_by_name(name)
    question_visibility_name = QuestionVisibilityName.find_by_name(name)
    question_visibility = question_visibility_name ? question_visibility_name.question_visibility : nil
  end

end
