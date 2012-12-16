class Category < ActiveRecord::Base
  include CommonScopes

  # a category has many category names (in different locales)
  has_many :category_names

  # a category has many category descriptions (in different locales)
  has_many :category_descriptions

  # a category has many topics
  has_many :topics

  # a category has many professions
  has_many :professions

  # name (by locale)
  def name(locale)
    self.category_names.by_locale
  end

  # search method
  def self.search(term)
    CategoryName.search(term).category
  end
end
