class Question < ActiveRecord::Base
  include Localizable
  include Classifiable

  attr_accessible :title, :details, :status, :status_id, :visibility, :visibility_id, :topics, :topic_ids, :author, :author_id

  # localization
  belongs_to :locale

  # classifications
  has_many :topics, :through => :classifications, :source => :taxonomy, :source_type => "Topic"

  # a question has a visibility and a status
  belongs_to :visibility, :class_name => "QuestionVisibility"
  belongs_to :status,     :class_name => "QuestionStatus"

  # a question belongs to an author
  belongs_to :author

  # a question can have many answers
  has_many :answers

  # set default values on init
  after_initialize :default_values

  # validation
  validates :title,  :presence => {:message => "Your question must have a descriptive title"}
  validates :topics, :presence => {:message => "Your question must be filed under one or many topics"}
  validates_existence_of :status
  validates_existence_of :visibility
  validates_existence_of :author
  validates_existence_of :locale

  def is_open?
    self.status == QuestionStatus.find_by_name("Open")
  end

  def topics_list
    self.topics.map {|topic| topic.name}.join(", ").html_safe
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  private

  def default_values
    self.status = QuestionStatus.find_by_name("Open") if self.status.nil?
    self.visibility = QuestionVisibility.find_by_name("Public") if self.visibility.nil?
    self.locale = Locale.find_by_code(I18n.locale) if (self.locale.nil? or self.locale_id.blank?)
  end
end
