class Where < ActiveRecord::Base

  attr_accessible :value, :level

  validates :value, :presence => true
  validates :level, :presence => true

end
