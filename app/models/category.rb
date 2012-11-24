class Category < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :description, :locale_id

  # a category has many topics
  has_many :topics

  # a category has many professions
  has_many :professions

  # I18n
  belongs_to :locale

  # set default values on init
  after_initialize :default_values

  # validation
  validates :name, :presence => true
  validates_existence_of :locale

  private

  def default_values
    self.slug = self.name.parameterize if self.slug.blank?
    self.locale = Locale.find_by_code(I18n.locale) if self.locale.nil?
  end
end
