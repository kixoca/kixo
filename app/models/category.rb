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

  def name(locale = nil)
    self.category_names.by_locale(locale).first.name
  end

  def description(locale = nil)
    self.category_descriptions.by_locale(locale).first.description
  end

  def self.find_by_name(name)
    CategoryName.find_by_name(name).category
  end

  def self.search(term, locale = nil)
    categories = Array.new
    CategoryName.by_locale(locale).search(term).each do |category_name|
      categories << category_name.category
    end
    categories
  end

  def to_param
    "#{self.name.parameterize}"
  end
end
