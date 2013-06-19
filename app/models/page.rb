class Page < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :name, :title, :content, :meta_title, :meta_description, :locale, :locale_id, :parent, :parent_id, :published_at, :deleted_at

  after_save    :expire_cache
  after_destroy :expire_cache

  after_initialize :default_values

  belongs_to :locale

  belongs_to :parent, :class_name => "Page"

  validates :name,  :presence => true, :length => {:maximum => 100}
  validates :title, :presence => true, :length => {:maximum => 100}
  validates :meta_title, :length => {:maximum => 100}

  def is_published?
    self.published_at <= Time.now
  end

  def to_param
    self.name
  end

  def self.all_cached
    Rails.cache.fetch("Page.all") { all }
  end

  def expire_cache
    Rails.cache.delete("Page.all")
  end

  private

  def default_values
    self.locale ||= Locale.find_by_code(I18n.locale)
  end
end
