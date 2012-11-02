class Review < ActiveRecord::Base
  include CommonScopes

  attr_accessible :title, :details, :status, :professional_id, :user_id, :locale_id

  # a review belongs to a professional
  belongs_to :professional

  # a review belongs to a user
  belongs_to :user

  # I18n
  belongs_to :locale

  # track versions with paper trail
  has_paper_trail

  # validation
  validates :comment, :presence => true
  validates :rating,  :presence => true
  validates :status,  :presence => true
  validates_existence_of :professional
  validates_existence_of :user
  validates_existence_of :locale

end
