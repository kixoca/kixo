class Category < ActiveRecord::Base

  include ApplicationHelper

  attr_accessible :name, :slug, :description, :locale_id

  # a category is linked to one or many professionals
  has_and_belongs_to_many :professionals

  # representants are assigned categories
  has_and_belongs_to_many :representants

  # a category has many topics
  has_many :topics

  # I18n
  belongs_to :locale

  # auto-generate slug from name
  before_validation :generate_slug_from_name

  # validation
  validates :name, :presence => true
  validates :slug, :presence => true

end
