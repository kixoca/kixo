class Rating < ActiveRecord::Base

  # a rating has many rating names (in different locales)
  has_many :rating_names

  # a rating belongs to a review
  has_many :reviews

end
