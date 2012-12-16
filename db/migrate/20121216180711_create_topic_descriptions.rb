class CreateTopicDescriptions < ActiveRecord::Migration
  def change
    create_table :topic_descriptions do |t|
      t.string  :description, :null => false, :default => ""
      t.integer :locale_id,   :null => false, :default => 0
      t.integer :topic_id,    :null => false, :default => 0
      t.timestamps
    end
  end
end
