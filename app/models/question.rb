class Question < ActiveRecord::Base
  include Localizable
  include Classifiable

  attr_accessible :title, :details, :status, :status_id, :is_private, :topics, :topic_ids, :author, :author_id

  # localization
  belongs_to :locale

  # classifications
  has_many :topics, :through => :classifications, :source => :taxonomy, :source_type => "Topic"

  # a question has a status
  belongs_to :status,     :class_name => "QuestionStatus"

  # a question belongs to an author
  belongs_to :author, :class_name => "User", :counter_cache => true

  # a question can have many answers
  has_many :answers, :order => "created_at ASC"

  # set default values on init
  after_initialize :default_values

  # validation
  validates :title,  :presence => {:message => "Your question must have a descriptive title"}
  validates :topics, :presence => {:message => "Your question must be filed under one or many topics"}
  validates_existence_of :status
  validates_existence_of :author
  validates_existence_of :locale

  def self.private
    self.where(:is_private => true)
  end

  def self.public
    self.where(:is_private => false)
  end

  def self.most_popular
    self.order("answers_count DESC")
  end

  def self.unanswered
    self.where(:answers_count => 0)
  end

  def self.answered
    self.where("answers_count > 0")
  end

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
    self.is_private = false if self.is_private.nil?
    self.status = QuestionStatus.find_by_name("Open") if self.status.nil?
    self.locale = Locale.find_by_code(I18n.locale) if (self.locale.nil? or self.locale_id.blank?)
  end
end
