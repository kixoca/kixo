class TopicName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :topic_id

  # a topic name belongs to a locale
  belongs_to :locale

  # a topic name belongs to a topic
  belongs_to :topic

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :topic

  # search method
  def self.search(term)
    TopicName.all(:conditions => ["name like ?", "%#{term}%"])
  end
end
