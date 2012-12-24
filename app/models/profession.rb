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
    profession_description = self.profession_descriptions.by_locale(locale).first
    profession_description ? profession_description.description : nil
  end

  def self.find_by_name(name)
    profession_name = ProfessionName.find_by_name(name)
    profession = profession_name ? profession_name.profession : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:profession_names).where(:conditions => {:profession_names => {:name => term, :locale_id => locale}})
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
