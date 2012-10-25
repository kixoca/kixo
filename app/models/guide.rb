class Guide < ActiveRecord::Base

  attr_accessible :title, :excerpt, :status, :content, :topic_id, :professional_id

  # a guide belongs to its author, a professional
  belongs_to :professional

  # a guide is associated with a topic
  belongs_to :topic

end
