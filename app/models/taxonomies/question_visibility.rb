class QuestionVisibility < Taxonomy
  include CommonScopes

  # a question visibility has many question visibility names (in different locales)
  has_many :names, :class_name => "QuestionVisibilityName"

  def self.find_by_name(name)
    question_visibility_name = QuestionVisibilityName.find_by_name(name)
    question_visibility = question_visibility_name ? question_visibility_name.question_visibility : nil
  end
end
