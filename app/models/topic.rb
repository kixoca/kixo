class Topic < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :description, :category_id

  # a topic belongs in a category
  belongs_to :category

  # a topic is associated with one or many questions
  has_and_belongs_to_many :questions

  # a topic is associated with one or many professionals
  has_and_belongs_to_many :professionals

  # validation
  validates :name, :presence => true
  validates_existence_of :category

  # search method
  def self.search(term)
    Topic.all(:conditions => ["name like ?", "%#{term}%"])
  end

  def to_param
    "#{name.parameterize}"
  end
end
