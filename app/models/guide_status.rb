class GuideStatus < ActiveRecord::Base

  attr_accessible :name

  has_many :guides

  validates :name, :presence => true

end
