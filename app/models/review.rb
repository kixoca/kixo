class Review < ActiveRecord::Base
  include Localizable
  include Classifiable

  attr_accessible :comment, :rating, :rating_id, :professional, :professional_id, :author, :author_id

  # localization
  belongs_to :locale

  # a review has a rating
  belongs_to :rating

  # a review belongs to a professional
  belongs_to :professional

  # a review belongs to a user
  belongs_to :author, :polymorphic => true

  # set default values on init
  after_initialize :default_values

  # validation
  validates :comment, :presence => true
  validates_existence_of :rating
  validates_existence_of :professional
  validates_existence_of :author
  validates_existence_of :locale

  private

  def default_values
    self.locale = Locale.find_by_code(I18n.locale) if (self.locale.nil? or self.locale_id.blank?)
  end
end
