class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string  :title,           :null => false, :default => ""
      t.string  :excerpt,         :null => false, :default => ""
      t.integer :guide_status_id, :null => false, :default => 0
      t.text    :content,         :null => false, :default => ""
      t.integer :topic_id,        :null => false, :default => 0
      t.integer :author_id,       :null => false, :default => 0
      t.integer :locale_id,       :null => false, :default => 0
      t.timestamps
    end
  end
end
