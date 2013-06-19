class Locale < ActiveRecord::Base
  attr_accessible :name, :code

  after_save    :expire_cache
  after_destroy :expire_cache

  has_many :localizations
  has_many :users, :through => :localizations, :source => :localizable, :source_type => "User"
  has_many :professionals, :class_name => "User", :through => :localizations, :source => :localizable, :source_type => "User", :conditions => {:is_professional => true}

  validates :name, :presence => true
  validates :code, :presence => true

  def self.all_cached
    Rails.cache.fetch("Locale.all") { all }
  end

  def self.find_by_code_cached(code)
    Rails.cache.fetch("Locale.find_by_code(#{code})") do
      find_by_code(code)
    end
  end

  def expire_cache
    Rails.cache.delete("Locale.all")
  end
end
