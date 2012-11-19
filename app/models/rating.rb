class Rating < ActiveRecord::Base
  include CommonScopes

  attr_accessible :label, :locale_id

  # a rating belongs to a review
  has_many :reviews

  # I18n
  belongs_to :locale

  # set default values on init
  after_initialize :default_values

  # validation
  validates :label, :presence => true
  validates_existence_of :locale

  private

  def default_values
    self.locale_id = Locale.find_by_code(I18n.locale).id if (self.locale_id.nil? or self.locale_id == 0)
  end
end
