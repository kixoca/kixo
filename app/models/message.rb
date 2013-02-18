class Message < ActiveRecord::Base
  attr_accessible :from, :from_id, :to, :to_id, :content, :read

  belongs_to :from, :class_name => "User"
  belongs_to :to,   :class_name => "User"

  validates_existence_of :from
  validates_existence_of :to
  validates :read, :presence => true, :inclusion => {:in => [true, false]}
end
