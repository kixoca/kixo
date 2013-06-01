class Locale < ActiveRecord::Base
  attr_accessible :name, :code

  has_many :localizations
  has_many :users, :through => :localizations, :source => :localizable, :source_type => "User"
  has_many :professionals, :class_name => "User", :through => :localizations, :source => :localizable, :source_type => "User", :conditions => {:is_professional => true}

  validates :name, :presence => true
  validates :code, :presence => true
end
