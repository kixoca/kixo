class Question < ActiveRecord::Base

  attr_accessible :title, :details, :status, :user_id

  # a question belongs to a user
  belongs_to :user

  # I18n
  belongs_to :locale

  # validation
  validates :title,  :presence => true
  validates :status, :presence => true
  validates_existence_of :user
  validates_existence_of :locale

end
