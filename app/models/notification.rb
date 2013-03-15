class Notification < ActiveRecord::Base
  attr_accessible :user, :user_id, :message, :link_to, :seen

  # a notification belongs to a user
  belongs_to :user

  # validation
  validates_existence_of :user
  validates :message, :presence => true
  validates :seen,    :presence => true, :inclusion => {:in => [true, false]}

  def self.unseen
    self.where(:seen => false)
  end
end
