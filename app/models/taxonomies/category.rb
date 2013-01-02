class Category < Taxonomy
  # a category has many topics
  has_many :topics, :foreign_key => "parent_id"

  # a category has many professions
  has_many :professions, :foreign_key => "parent_id"
end
