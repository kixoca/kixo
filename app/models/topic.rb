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
    self.topic_descriptions.by_locale(locale).first.description
  end

  def self.find_by_name(name)
    TopicName.find_by_name(name).topic
  end

  def self.search(term, locale = nil)
    topics = Array.new
    TopicName.by_locale(locale).search(term).each do |topic_name|
      topics << topic_name.topic
    end
    topics
  end

  def to_param
    "#{self.name.parameterize}"
  end
end
