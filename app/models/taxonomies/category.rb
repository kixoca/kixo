class Category < Taxonomy
  include CommonScopes

  # a category has many names (in different locales)
  has_many :names, :class_name => "CategoryName"

  # a category has many descriptions (in different locales)
  has_many :descriptions, :class_name => "CategoryDescription"

  # a category has many topics
  has_many :topics, :foreign_key => "parent_id"

  # a category has many professions
  has_many :professions, :foreign_key => "parent_id"

  def self.find_by_name(name)
    category_name = CategoryName.find_by_name(name)
    category = category_name ? category_name.category : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:category_names).where(:conditions => {:category_names => {:name => term, :locale_id => locale}})
  end
end
