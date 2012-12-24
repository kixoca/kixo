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
    category_name = CategoryName.find_by_name(name)
    category = category_name ? category_name.category : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:category_names).where(:conditions => {:category_names => {:name => term, :locale_id => locale}})
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
