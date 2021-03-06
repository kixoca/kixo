class Guide < ActiveRecord::Base
  include Localizable
  include Classifiable

  attr_accessible :title, :excerpt, :content, :status, :status_id, :author, :author_id, :deleted_at

  # localization
  belongs_to :locale

  # classifications
  has_many :topics, :through => :classifications, :source => :taxonomy

  belongs_to :status, :class_name => "GuideStatus"

  belongs_to :author, :class_name => "User"

  # a guide can have one or many comments
  has_many :comments, :as => :commentable

  # set default values on init
  after_initialize :default_values

  # validation
  validates :title,   :presence => true, :length => {:maximum => 150}
  validates :excerpt, :presence => true, :length => {:maximum => 250}
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
    self.locale = Locale.find_by_code(I18n.locale) if (self.locale.nil? or self.locale_id.blank?)
  end
end
