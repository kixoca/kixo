class Category < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :description

  # a category has many topics
  has_many :topics

  # a category has many professions
  has_many :professions

  # validation
  validates :name, :presence => true

  def to_param
    "#{name.parameterize}"
  end
end
