class QuestionStatus < Taxonomy
  include CommonScopes

  # a question status has many question status names (in different locales)
  has_many :names, :class_name => "QuestionStatusName"

  def self.find_by_name(name)
    question_status_name = QuestionStatusName.find_by_name(name)
    question_status = question_status_name ? question_status_name.question_status : nil
  end
end
