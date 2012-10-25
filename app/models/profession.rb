class Profession < ActiveRecord::Base

  include ApplicationHelper

  attr_accessible :name, :slug, :description

  # a profession is linked to one or many professionals
  has_and_belongs_to_many :professionals

  # validation
  validates :title,   :presence => true
  validates :excerpt, :presence => true
  validates :status,  :presence => true
  validates :content, :presence => true
  validates_existence_of :topic
  validates_existence_of :professional

  # auto-generate slug from name
  before_validation :generate_slug_from_name

  # validation
  validates :name, :presence => true
  validates :slug, :presence => true

end
