class Where < ActiveRecord::Base

  attr_accessible :value, :level

  # every Where is linked with a location
  belongs_to :location

  validates :value, :presence => true
  validates :level, :presence => true

end
