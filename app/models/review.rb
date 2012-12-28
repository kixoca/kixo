class Review < ActiveRecord::Base
  include CommonScopes

  attr_accessible :comment, :rating_id, :professional_id, :author_id, :locale_id

  # a review has one rating
  belongs_to :rating

  # a review belongs to a professional
  belongs_to :professional

  # a review belongs to a user
  belongs_to :author, :polymorphic => true

  # I18n
  belongs_to :locale

  # track versions with paper trail
  has_paper_trail

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
    self.locale_id = Locale.find_by_code(I18n.locale).id if (self.locale_id.nil? or self.locale_id == 0)
  end
end
