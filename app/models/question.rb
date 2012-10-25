class Question < ActiveRecord::Base

  attr_accessible :title, :details, :status, :user_id

  # a question belongs to a user
  belongs_to :user

end
