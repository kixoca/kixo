class Rating < Taxonomy
  include CommonScopes

  # a rating has many rating names (in different locales)
  has_many :names, :class_name => "RatingName"

  def self.find_by_name(name)
    rating_name = RatingName.find_by_name(name)
    rating = rating_name ? rating_name.rating : nil
  end
end
