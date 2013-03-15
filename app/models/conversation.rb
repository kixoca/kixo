class Conversation < ActiveRecord::Base
  attr_accessible :participants, :participant_ids

  has_many :conversation_participations
  has_many :participants, :through => :conversation_participations, :class_name => "User"

  has_many :messages, :dependent => :destroy

  accepts_nested_attributes_for :messages
  attr_accessible :messages_attributes
end
