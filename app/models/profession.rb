class Profession < ActiveRecord::Base

  include ApplicationHelper

  attr_accessible :name, :slug, :description

  # a profession is linked to one or many professionals
  has_and_belongs_to_many :professionals

  # auto-generate slug from name
  before_save :generate_slug_from_name

end
