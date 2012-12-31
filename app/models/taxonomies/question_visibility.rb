class QuestionVisibility < Taxonomy

  def self.find_by_name(name)
    question_visibility_name = QuestionVisibilityName.find_by_name(name)
    question_visibility = question_visibility_name ? question_visibility_name.question_visibility : nil
  end

end
