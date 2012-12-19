class QuestionStatus < ActiveRecord::Base

  # a question status has many question status names (in different locales)
  has_many :question_status_names

  has_many :questions

  def name(locale = nil)
    self.question_status_names.by_locale(locale).first.name
  end

  def self.find_by_name(name)
    question_status_name = QuestionStatusName.find_by_name(name)
    question_status = question_status_name ? question_status_name.question_status : nil
  end

end
