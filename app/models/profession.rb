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

  def name(locale = nil)
    self.profession_names.by_locale(locale).first.name
  end

  def description(locale = nil)
    self.profession_descriptions.by_locale(locale).first.description
  end

  def self.find_by_name(name)
    ProfessionName.find_by_name(name).profession
  end

  def self.search(term, locale = nil)
    professions = Array.new
    ProfessionName.by_locale(locale).search(term).each do |profession_name|
      professions << profession_name.profession
    end
    professions
  end

  def to_param
    "#{self.name.parameterize}"
  end
end
