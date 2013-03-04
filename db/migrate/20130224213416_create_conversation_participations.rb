class CreateConversationParticipations < ActiveRecord::Migration
  def change
    create_table :conversation_participations, :id => false do |t|
      t.references :conversation, :null => false, :default => 0
      t.references :participant,  :null => false, :default => 0
      t.timestamps
    end
  end
end
