class Ad < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :advertiser, :advertiser_id,
                  :format, :visual, :destination,
                  :views, :clicks,
                  :expired_at, :deleted_at

  after_initialize :default_values

  belongs_to :advertiser, :class_name => "User"

  belongs_to :locale

  has_many :views,  :class_name => "AdView"
  has_many :clicks, :class_name => "AdClick"

  has_attached_file :visual

  validates :advertiser,  :presence => true
  validates :format,      :presence => true
  validates :visual,      :presence => true
  validates :destination, :presence => true
  validates :locale,      :presence => true

  def is_expired?
    self.expired_at and self.expired_at < Time.now
  end

  private

  def default_values
    self.locale ||= Locale.find_by_code(I18n.locale)
  end
end
