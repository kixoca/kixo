class Category < Taxonomy
  after_save    :expire_cache
  after_destroy :expire_cache

  has_many :topics,      :foreign_key => "parent_id"
  has_many :professions, :foreign_key => "parent_id"

  has_many :professionals, :through => :topics, :conditions => {:is_professional => true}
  has_many :questions,     :through => :topics
  has_many :guides,        :through => :topics

  def self.most_popular(n = 10)
    self.order("questions_count DESC").limit(n)
  end

  def self.all_cached
    Rails.cache.fetch('Category.all') { all }
  end

  def self.most_popular_cached(n = 10)
    Rails.cache.fetch("Category.most_popular(#{n})") { order("questions_count DESC").limit(n) }
  end

  def expire_cache
    Rails.cache.delete('Category.all')
  end
end
