class Message < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :author, :message, :read, :deleted_at

  belongs_to :conversation, :counter_cache => true
  belongs_to :author, :class_name => "User"

  after_initialize :set_default_values

  after_create :notify_of_message

  validates :message, :presence => true
  validates :author,  :presence => true

  def self.unread
    self.where(:read => false)
  end

  def notify_of_message
    UserMailer.delay.notify_of_message(self)
  end

  private

  def set_default_values
    self.read = false if self.read.blank?
  end
end
