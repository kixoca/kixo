class TopicDescription < ActiveRecord::Base
  include CommonScopes

  attr_accessible :description, :locale_id, :category_id

  # a topic description belongs to a locale
  belongs_to :locale

  # a topic description belongs to a topic
  belongs_to :topic

  # validation
  validates :description, :presence => true
  validates_existence_of :locale
  validates_existence_of :topic
end
