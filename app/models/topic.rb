class Topic < ActiveRecord::Base
  include CommonScopes

  attr_accessible :category_id

  # a topic has many topic names (in different locales)
  has_many :topic_names

  # a topic has many topic descriptions (in different locales)
  has_many :topic_descriptions

  # a topic belongs in a category
  belongs_to :category

  # a topic is associated with one or many questions
  has_and_belongs_to_many :questions

  # a topic is associated with one or many professionals
  has_and_belongs_to_many :professionals

  # a topic has many guides
  has_many :guides

  # validation
  validates_existence_of :category

  def name(locale = nil)
    self.topic_names.by_locale(locale).first.name
  end

  def description(locale = nil)
    topic_description = self.topic_descriptions.by_locale(locale).first
    topic_description ? topic_description.description : nil
  end

  def self.find_by_name(name)
    topic_name = TopicName.find_by_name(name)
    topic = topic_name ? topic_name.topic : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:topic_names).where(:conditions => {:topic_names => {:name => term, :locale_id => locale}})
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
