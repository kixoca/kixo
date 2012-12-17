class RatingName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :rating_id

  # a rating name belongs to a locale
  belongs_to :locale

  # a rating name belongs to a rating
  belongs_to :rating

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :rating
end
