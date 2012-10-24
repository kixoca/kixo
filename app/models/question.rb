class Question < ActiveRecord::Base

  # a question belongs to a user
  belongs_to :user

end
