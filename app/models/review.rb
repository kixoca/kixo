class Review < ActiveRecord::Base

  # a review belongs to a professional
  belongs_to :professional

  # a review belongs to a user
  belongs_to :user

end
