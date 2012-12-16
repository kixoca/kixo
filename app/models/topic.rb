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

  # search method
  def self.search(term)
    TopicName.search(term).topic
  end
end
