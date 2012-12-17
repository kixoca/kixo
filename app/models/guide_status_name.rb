class GuideStatusName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :guide_status_id

  # a guide status name belongs to a locale
  belongs_to :locale

  # a guide status name belongs to a guide status
  belongs_to :guide_status

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :guide_status
end
