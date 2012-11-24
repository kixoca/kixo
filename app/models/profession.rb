class Profession < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :description, :category_id, :locale_id

  # a profession belongs in a category
  belongs_to :category

  # a profession is linked to one or many professionals
  has_and_belongs_to_many :professionals

  # I18n
  belongs_to :locale

  # set default values on init
  after_initialize :default_values

  # validation
  validates :name, :presence => true
  validates_existence_of :category
  validates_existence_of :locale

  # search method
  def self.search(term)
    Profession.all(:conditions => ["name like ?", "%#{term}%"])
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  private

  def default_values
    self.slug = self.name.parameterize if self.slug.blank?
    self.locale = Locale.find_by_code(I18n.locale) if self.locale.nil?
  end
end
