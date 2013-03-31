class CreateConversationParticipations < ActiveRecord::Migration
  def change
    create_table :conversation_participations do |t|
      t.references :conversation, :null => false, :default => 0
      t.references :participant,  :null => false, :default => 0
      t.timestamps
    end

    add_index :conversation_participations, [:conversation_id, :participant_id], :unique => true, :name => "index_conversation_participant"
    add_index :conversation_participations, [:participant_id, :conversation_id], :unique => true, :name => "index_participant_conversation"
  end
end
