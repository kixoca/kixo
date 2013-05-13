class Message < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :author, :message, :read, :deleted_at

  belongs_to :conversation, :counter_cache => true
  belongs_to :author, :class_name => "User"

  # set default values on init
  after_initialize :default_values

  validates :message, :presence => true
  validates :author,  :presence => true

  def self.unread
    self.where(:read => false)
  end

  private

  def default_values
    self.read = false if self.read.blank?
  end
end
