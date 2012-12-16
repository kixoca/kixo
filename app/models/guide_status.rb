class GuideStatus < ActiveRecord::Base

  # a guide status has many guide status names (in different locales)
  has_many :guide_status_names

  has_many :guides

end
