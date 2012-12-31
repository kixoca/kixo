class Guide < ActiveRecord::Base
  include CommonScopes

  attr_accessible :title, :excerpt, :content, :status_id, :author_id, :locale_id

  # a guide has a status
  belongs_to :status, :class_name => "GuideStatus"

  # classifications
  has_many :classifications
  has_many :topics, :through => :classifications

  # a guide belongs to its author, a professional
  belongs_to :author, :polymorphic => true

  # I18n
  belongs_to :locale

  # track versions with paper trail
  has_paper_trail

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
