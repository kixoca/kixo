class AdClick < ActiveRecord::Base
  attr_accessible :ad, :ad_id, :locale, :locale_id, :clicker, :clicker_id, :ip

  after_initialize :default_values

  belongs_to :ad, :counter_cache => true

  belongs_to :clicker, :class_name => "User"

  validates :ad,     :presence => true
  validates :locale, :presence => true

  private

  def default_values
    self.clicker ||= current_user if user_signed_in?
    self.locale ||= Locale.find_by_code(I18n.locale)
    self.ip ||= request.remote_ip
  end
end
