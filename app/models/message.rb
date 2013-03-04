class Message < ActiveRecord::Base
  attr_accessible :author, :message, :read

  belongs_to :conversation
  belongs_to :author, :class_name => "User"

  # set default values on init
  after_initialize :default_values

  validates_existence_of :author

  private

  def default_values
    self.read = false if self.read.blank?
  end
end
