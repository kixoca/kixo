class TopicDescription < ActiveRecord::Base
  include CommonScopes

  # a topic description belongs to a topic
  belongs_to :topic, :foreign_key => "taxonomy_id"

  # validation
  validates_existence_of :topic
end
