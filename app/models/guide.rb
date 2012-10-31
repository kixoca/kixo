class Guide < ActiveRecord::Base

  attr_accessible :title, :excerpt, :status, :content, :topic_id, :professional_id, :locale_id

  # a guide belongs to its author, a professional
  belongs_to :professional

  # a guide is associated with a topic
  belongs_to :topic

  # I18n
  belongs_to :locale

  # track versions with paper trail
  has_paper_trail

  # auto-generate slug from title
  before_validation :generate_slug_from_title

  # validation
  validates :title,   :presence => true
  validates :slug,    :presence => true
  validates :excerpt, :presence => true
  validates :status,  :presence => true
  validates :content, :presence => true
  validates_existence_of :topic
  validates_existence_of :professional
  validates_existence_of :locale

end
