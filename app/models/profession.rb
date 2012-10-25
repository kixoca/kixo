class Profession < ActiveRecord::Base

  attr_accessible :name, :slug, :description

  # a profession is linked to one or many professionals
  has_and_belongs_to_many :professions

end
