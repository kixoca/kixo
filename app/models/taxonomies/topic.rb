class Topic < Taxonomy
  attr_accessible :category

  # a topic belongs in a category
  belongs_to :category, :foreign_key => "parent_id"

  def self.find_by_name(name)
    topic_name = TopicName.find_by_name(name)
    topic = topic_name ? topic_name.topic : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:topic_names).where(:conditions => {:topic_names => {:name => term, :locale_id => locale}})
  end
end