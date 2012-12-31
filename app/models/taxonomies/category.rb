class Category < Taxonomy

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
