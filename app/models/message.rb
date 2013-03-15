class Message < ActiveRecord::Base
  attr_accessible :author, :message, :read

  belongs_to :conversation, :counter_cache => true
  belongs_to :author, :class_name => "User"

  # set default values on init
  after_initialize :default_values

  validates_existence_of :author

  def self.unread
    self.where(:read => false)
  end

  private

  def default_values
    self.read = false if self.read.blank?
  end
end
