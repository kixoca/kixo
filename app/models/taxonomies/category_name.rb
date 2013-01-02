class CategoryName < TaxonomyName
  attr_accessible :category

  # a category name belongs to a category
  belongs_to :category, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :category
end
