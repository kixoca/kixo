class Question < ActiveRecord::Base
  include CommonScopes

  attr_accessible :title, :details, :status, :status_id, :visibility, :visibility_id, :topics, :topic_ids, :author, :author_id, :locale, :locale_id

  # a questions belongs to a user
  belongs_to :author, :polymorphic => true

  # a question can have one or many answers
  has_many :answers

  # classifications
  has_many :classifications, :as => :classifiable, :foreign_key => :classifiable_id, :dependent => :destroy
  has_many :taxonomies, :through => :classifications, :source => :taxonomy
  has_one  :visibility, :through => :classifications, :source => :taxonomy, :source_type => "QuestionVisibility"
  has_one  :status,     :through => :classifications, :source => :taxonomy, :source_type => "QuestionStatus"
  has_many :topics,     :through => :classifications, :source => :taxonomy, :source_type => "Topic"

  accepts_nested_attributes_for :topics

  # localization
  has_one :localization
  has_one :locale, :through => :localization

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
