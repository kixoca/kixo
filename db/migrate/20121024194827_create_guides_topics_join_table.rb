class CreateGuidesTopicsJoinTable < ActiveRecord::Migration
  def change
    create_table :guides_topics, :id => false do |t|
      t.integer :guide_id
      t.integer :topic_id
    end
  end
end
