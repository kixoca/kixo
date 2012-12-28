class Question < ActiveRecord::Base
  include CommonScopes

  attr_accessible :title, :details, :status_id, :visibility_id, :topic_ids, :author_id, :locale_id

  # a questions belongs to a user
  belongs_to :author, :polymorphic => true

  # a question can have one or many answers
  has_many :answers

  # a question is related to one or many topics
  has_and_belongs_to_many :topics

  # a question has a status
  belongs_to :status, :class_name => "QuestionStatus"

  # a question has a visibility
  belongs_to :visibility, :class_name => "QuestionVisibility"

  # I18n
  belongs_to :locale

  # track versions with paper trail
  has_paper_trail

  # set default values on init
  after_initialize :default_values

  # validation
  validates :title, :presence => true
  validates_presence_of  :topics
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

  def related_professionals
    Professional.find_by_topic(self.topics)
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  private

  def default_values
    self.status = QuestionStatus.find_by_name("Open") if self.status.nil?
    self.visibility = QuestionVisibility.find_by_name("Public") if self.visibility.nil?
    self.locale = Locale.find_by_code(I18n.locale) if (self.locale_id.nil? or self.locale_id == 0)
  end

end
