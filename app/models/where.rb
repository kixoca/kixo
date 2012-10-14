class Where < ActiveRecord::Base

  attr_accessible :value, :level

  belongs_to :location

  validates :value, :presence => true
  validates :level, :presence => true

end
