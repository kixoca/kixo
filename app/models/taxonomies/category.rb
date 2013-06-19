class Category < Taxonomy
  has_many :topics,      :foreign_key => "parent_id"
  has_many :professions, :foreign_key => "parent_id"

  has_many :professionals, :through => :topics, :conditions => {:is_professional => true}
  has_many :questions,     :through => :topics
  has_many :guides,        :through => :topics

  def self.most_popular(n = 10)
    self.order("questions_count DESC").limit(n)
  end
end
