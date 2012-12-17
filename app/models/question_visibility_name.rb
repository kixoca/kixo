class QuestionVisibilityName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :question_visibility_id

  # a question visibility name belongs to a locale
  belongs_to :locale

  # a question visibility name belongs to a question visibility
  belongs_to :question_visibility

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :question_visibility
end
