class Topic < Taxonomy
  attr_accessible :category

  # a topic belongs in a category
  belongs_to :category, :foreign_key => "parent_id"
end
