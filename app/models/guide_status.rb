class GuideStatus < ActiveRecord::Base

  # a guide status has many guide status names (in different locales)
  has_many :guide_status_names

  has_many :guides

  def name(locale = nil)
    self.guide_status_names.by_locale(locale).first.name
  end

  def self.find_by_name(name)
    guide_status_name = GuideStatusName.find_by_name(name)
    guide_status = guide_status_name ? guide_status_name.guide_status : nil
  end

end
