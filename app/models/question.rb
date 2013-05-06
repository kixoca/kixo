class Question < ActiveRecord::Base
  include Localizable
  include Classifiable
  include Geolocalizable

  acts_as_paranoid

  # set default values on init
  after_initialize :default_values

  attr_accessible :title, :details, :status, :status_id, :is_private, :topics, :topic_ids, :author, :author_id, :locality, :locality_id, :deleted_at

  # localization
  belongs_to :locale

  # geolocalization
  belongs_to :locality

  # classifications
  has_many :topics, :through => :classifications, :source => :taxonomy, :source_type => "Topic"

  # a question has a status
  belongs_to :status, :class_name => "QuestionStatus"

  # a question belongs to an author
  belongs_to :author, :class_name => "User", :counter_cache => true

  # a question can have one or many answers
  has_many :answers, :order => "created_at ASC"

  # a question can have one or many comments
  has_many :comments, :as => :commentable

  # validation
  validates :title,  :presence => {:message => I18n.t("questions.fields.title.validation.presence")}
  validates :topics, :presence => {:message => I18n.t("questions.fields.topics.validation.presence")}
  validates :status, :presence => {:message => I18n.t("questions.fields.status.validation.presence")}
  validates :author, :presence => {:message => I18n.t("questions.fields.author.validation.presence")}
  validates :locale, :presence => {:message => I18n.t("questions.fields.locale.validation.presence")}

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
    self.is_private ||= false
    self.status ||= QuestionStatus.find_by_name("Open", Locale.find_by_code("en"))
    self.locale ||= Locale.find_by_code(I18n.locale)
  end
end
