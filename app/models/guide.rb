class Guide < ActiveRecord::Base
  include CommonScopes

  attr_accessible :title, :excerpt, :content, :status, :status_id, :author, :author_id, :locale, :locale_id

  # classifications
  has_many :classifications, :as => :classifiable, :foreign_key => :classifiable_id, :dependent => :destroy
  has_one  :status, :through => :classifications, :source => :taxonomy, :source_type => "GuideStatus"
  has_many :topics, :through => :classifications, :source => :taxonomy

  # a guide belongs to its author, a professional
  belongs_to :author, :polymorphic => true

  # I18n
  has_one :localization, :as => :localizable, :foreign_key => :localizable_id, :dependent => :destroy
  has_one :locale, :through => :localization

  # set default values on init
  after_initialize :default_values

  # validation
  validates :title,   :presence => true
  validates :excerpt, :presence => true
  validates :content, :presence => true
  validates_existence_of :classifications
  validates_existence_of :status
  validates_existence_of :author
  validates_existence_of :locale

  def is_published?
    self.status == GuideStatus.find_by_name("Published")
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  private

  def default_values
    self.status = GuideStatus.find_by_name("Draft") if (self.status.nil? or self.status == 0)
    self.locale = Locale.find_by_code(I18n.locale) if (self.locale.nil? or self.locale_id == 0)
  end
end
