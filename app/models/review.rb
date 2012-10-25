class Review < ActiveRecord::Base

  attr_accessible :title, :details, :status, :professional_id, :user_id

  # a review belongs to a professional
  belongs_to :professional

  # a review belongs to a user
  belongs_to :user

  # validation
  validates :comment, :presence => true
  validates :rating,  :presence => true
  validates :status,  :presence => true
  validates_existence_of :professional
  validates_existence_of :user

end
