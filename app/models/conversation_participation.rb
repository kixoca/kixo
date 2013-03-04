class ConversationParticipation < ActiveRecord::Base
  attr_accessible :conversation, :conversation_id, :participant, :participant_id

  belongs_to :conversation
  belongs_to :participant, :class_name => "User"
end
