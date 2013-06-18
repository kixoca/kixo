class Profession < Taxonomy
  attr_accessible :category

  # a profession belongs in a category
  belongs_to :category, :foreign_key => :parent_id

  has_many :classifications, :as => :taxonomy, :foreign_key => :taxonomy_id, :source_type => "Profession"
  has_many :professionals, :through => :classifications, :as => :taxonomy, :source => :classifiable, :source_type => "User", :conditions => {:is_professional => true}
  has_many :questions,     :through => :classifications, :as => :taxonomy, :source => :classifiable, :source_type => "Question"
  has_many :guides,        :through => :classifications, :as => :taxonomy, :source => :classifiable, :source_type => "Guide"

  def self.all_cached
    Rails.cache.fetch('Profession.all') { all }
  end

  def expire_cache
    Rails.cache.delete('Profession.all')
  end

  def self.most_popular(n = 10)
    self.order("users_count DESC").limit(n)
  end
end
