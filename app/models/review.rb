class Review < ActiveRecord::Base
  include CommonScopes

  attr_accessible :comment, :rating, :rating_id, :professional, :professional_id, :author, :author_id, :locale, :locale_id

  # a review has one rating
  has_many :classifications, :as => :classifiable, :foreign_key => :classifiable_id, :dependent => :destroy
  has_one :rating, :through => :classifications, :source => :taxonomy, :source_type => "Rating"

  # a review belongs to a professional
  belongs_to :professional

  # a review belongs to a user
  belongs_to :author, :polymorphic => true

  # localization
  has_one :localization, :as => :localizable, :foreign_key => :localizable_id, :dependent => :destroy
  has_one :locale, :through => :localization

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
    self.locale = Locale.find_by_code(I18n.locale) if (self.locale.nil? or self.locale_id == 0)
  end
end
