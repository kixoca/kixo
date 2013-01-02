class Profession < Taxonomy
  attr_accessible :category

  # a profession belongs in a category
  belongs_to :category, :foreign_key => :parent_id
end
