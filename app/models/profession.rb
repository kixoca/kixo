class Profession < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :slug, :description, :locale_id

  # a profession is linked to one or many professionals
  has_and_belongs_to_many :professionals

  # I18n
  belongs_to :locale

  # set default values on init
  after_initialize :default_values

  # validation
  validates :name, :presence => true
  validates :slug, :presence => true
  validates_existence_of :locale

  private

  def default_values
    self.locale_id = Locale.find_by_code(I18n.locale).id if (self.locale_id.nil? or self.locale_id == 0)
  end

end
