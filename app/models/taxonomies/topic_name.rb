class TopicName < TaxonomyName
  include CommonScopes

  # a topic name belongs to a topic
  belongs_to :topic, :foreign_key => "taxonomy_id"

  # validation
  validates_existence_of :topic

  def self.search(term, locale = nil)
    TopicName.by_locale(locale).all(:conditions => ["name like ?", "%#{term}%"])
  end
end
