class Rating < Taxonomy

  def self.find_by_name(name)
    rating_name = RatingName.find_by_name(name)
    rating = rating_name ? rating_name.rating : nil
  end

end
