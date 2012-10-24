class Category < ActiveRecord::Base

  attr_accessible :slug, :name, :description

  # a category is linked to one or many professionals
  has_and_belongs_to_many :professionals

  # representants are assigned categories
  has_and_belongs_to_many :representants

  # a category has many topics
  has_many :topics

end
