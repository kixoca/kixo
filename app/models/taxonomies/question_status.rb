class QuestionStatus < Taxonomy
  def self.find_by_name(name)
    question_status_name = QuestionStatusName.find_by_name(name)
    question_status = question_status_name ? question_status_name.question_status : nil
  end
end
