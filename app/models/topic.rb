class Topic < ActiveRecord::Base

  include ApplicationHelper

  attr_accessible :name, :slug, :description, :category_id, :locale_id

  # a topic belongs in a category
  belongs_to :category

  # a topic is associated with one or many questions
  has_and_belongs_to_many :questions

  # I18n
  belongs_to :locale

  # auto-generate slug from name
  before_validation :generate_slug_from_name

  # validation
  validates :name, :presence => true
  validates :slug, :presence => true
  validates_existence_of :category

end
