class CreateProfessionalsTopicsJoinTable < ActiveRecord::Migration
  def change
    create_table :professionals_topics, :id => false do |t|
      t.integer :professional_id
      t.integer :topic_id
    end
  end
end
