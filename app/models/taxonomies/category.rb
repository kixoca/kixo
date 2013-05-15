class Category < Taxonomy
  has_many :classifications, :as => :taxonomy, :foreign_key => :taxonomy_id, :source_type => "Category"
  has_many :professionals, :through => :classifications, :source => :classifiable, :source_type => "User", :conditions => {:is_professional => true}
  has_many :questions,     :through => :classifications, :source => :classifiable, :source_type => "Question"
  has_many :guides,        :through => :classifications, :source => :classifiable, :source_type => "Guide"

  # a category has many topics
  has_many :topics, :foreign_key => "parent_id"

  # a category has many professions
  has_many :professions, :foreign_key => "parent_id"

  def self.most_popular(n = 10)
    self.order("questions_count DESC").limit(n)
  end
end
