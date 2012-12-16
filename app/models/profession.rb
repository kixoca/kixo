class Profession < ActiveRecord::Base
  include CommonScopes

  attr_accessible :category_id

  # a profession has many profession names (in different locales)
  has_many :profession_names

  # a profession has many profession descriptions (in different locales)
  has_many :profession_descriptions

  # a profession belongs in a category
  belongs_to :category

  # a profession is linked to one or many professionals
  has_and_belongs_to_many :professionals

  # validation
  validates_existence_of :category

  # search method
  def self.search(term)
    ProfessionName.search(term).profession
  end
end
