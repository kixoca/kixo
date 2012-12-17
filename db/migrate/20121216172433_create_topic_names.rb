class CreateTopicNames < ActiveRecord::Migration
  def change
    create_table :topic_names do |t|
      t.string  :name,      :null => false, :default => ""
      t.integer :locale_id, :null => false, :default => 0
      t.integer :topic_id,  :null => false, :default => 0
    end
  end
end
