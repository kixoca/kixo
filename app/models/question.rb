class Question < ActiveRecord::Base
  include Localizable
  include Classifiable
  include Geolocalizable

  acts_as_paranoid

  attr_accessible :title, :details, :status, :status_id, :is_private, :topics, :topic_ids, :author, :author_id, :locality, :locality_id, :deleted_at

  after_initialize :default_values

  before_validation :set_locality_from_author

  after_create :notify_of_question

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
  validates :title,  :presence => true, :length => {:minimum => 25, :maximum => 250}
  validates :topics, :presence => true
  validates :status, :presence => true
  validates :author, :presence => true
  validates :locale, :presence => true

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
    self.status == QuestionStatus.find_by_name("Open", Locale.find_by_code(:en))
  end

  def topics_list
    self.topics.map {|topic| topic.name}.join(", ").html_safe
  end

  def location_changed?
    self.locality_id_changed?
  end

  def set_locality_from_author
    self.locality = self.author.locality
  end

  def notify_of_question
    UserMailer.delay.notify_of_question(self)
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  private

  def default_values
    self.is_private = false if self.is_private.blank?
    self.status     = QuestionStatus.find_by_name("Open", Locale.find_by_code("en")) if self.status.blank?
    self.locale     = Locale.find_by_code(I18n.locale) if self.locale.blank?
  end
end
