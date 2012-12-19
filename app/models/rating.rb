class Rating < ActiveRecord::Base

  # a rating has many rating names (in different locales)
  has_many :rating_names

  # a rating belongs to a review
  has_many :reviews

  def self.find_by_name(name)
    rating_name = RatingName.find_by_name(name)
    rating = rating_name ? rating_name.rating : nil
  end

end
