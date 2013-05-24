class Topic < Taxonomy
  attr_accessible :category

  # a topic belongs in a category
  belongs_to :category, :foreign_key => "parent_id"

  has_many :classifications, :as => :taxonomy, :foreign_key => :taxonomy_id, :source_type => "Topic"
  has_many :professionals, :through => :classifications, :source => :classifiable, :source_type => "User", :conditions => {:is_professional => true}
  has_many :questions,     :through => :classifications, :source => :classifiable, :source_type => "Question"
  has_many :guides,        :through => :classifications, :source => :classifiable, :source_type => "Guide"

  def self.most_popular(n = 10)
    self.order("questions_count DESC, users_count DESC").limit(n)
  end
end
