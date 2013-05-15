class Ad < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :advertiser, :advertiser_id, :advertiser_type,
                  :format, :visual, :destination,
                  :views, :clicks,
                  :expires_at, :deleted_at

  after_initialize :default_values

  belongs_to :advertiser, :class_name => "User"

  belongs_to :locale

  has_many :views,  :class_name => "AdView"
  has_many :clicks, :class_name => "AdClick"

  has_attached_file :visual

  private

  def default_values
    self.advertiser ||= current_user if user_signed_in?
    self.locale ||= Locale.find_by_code(I18n.locale)
  end
end
