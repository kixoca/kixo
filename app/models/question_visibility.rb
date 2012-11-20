class QuestionVisibility < ActiveRecord::Base

  attr_accessible :name

  has_many :questions

  validates :name, :presence => true

end
