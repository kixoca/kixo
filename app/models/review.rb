class Review < ActiveRecord::Base
  include Localizable
  include Classifiable

  attr_accessible :comment, :rating, :rating_id, :professional, :professional_id, :author, :author_id, :deleted_at

  # localization
  belongs_to :locale

  # a review has a rating
  belongs_to :rating

  # a review belongs to the reviewed professional (User)
  belongs_to :professional, :class_name => "User", :counter_cache => true

  # a review belongs to an author (a user)
  belongs_to :author, :class_name => "User"

  # set default values on init
  after_initialize :default_values

  # validation
  validates :comment, :presence => true
  validates_existence_of :rating
  validates_existence_of :professional
  validates_existence_of :author
  validates_existence_of :locale

  paginates_per 2

  private

  def default_values
    self.locale = Locale.find_by_code(I18n.locale) if (self.locale.nil? or self.locale_id.blank?)
  end
end
