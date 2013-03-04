class Conversation < ActiveRecord::Base
  attr_accessible :participants, :participant_ids, :messages, :messages_attributes

  has_many :conversation_participations
  has_many :participants, :through => :conversation_participations, :class_name => "User"

  has_many :messages

  accepts_nested_attributes_for :messages
end
