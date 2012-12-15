class Category < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :description

  # a category has many topics
  has_many :topics

  # a category has many professions
  has_many :professions

  # set default values on init
  after_initialize :default_values

  # validation
  validates :name, :presence => true

  def to_param
    "#{name.parameterize}"
  end
end
