class Rating < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name

  # a rating belongs to a review
  has_many :reviews

  # validation
  validates :name, :presence => true
end
