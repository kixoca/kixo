class Profession < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :slug, :description, :category_id, :locale_id

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
  validates :slug, :presence => true
  validates_existence_of :category
  validates_existence_of :locale

  # search method
  def self.search(term)
    Profession.all(:conditions => ["name like ?", "%#{term}%"])
  end

  private

  def default_values
    self.slug = self.name.parameterize if self.slug.blank?
    self.locale_id = Locale.find_by_code(I18n.locale).id if (self.locale_id.nil? or self.locale_id == 0)
  end

end
