class CategoryName < TaxonomyName

  attr_accessible :category

  # a category name belongs to a category
  belongs_to :category, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :category

  def self.search(term, locale = nil)
    CategoryName.by_locale(locale).all(:conditions => ["name like ?", "%#{term}%"])
  end

end
