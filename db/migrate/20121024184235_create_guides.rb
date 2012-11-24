class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string  :title,           :null => false, :default => ""
      t.string  :excerpt,         :null => false, :default => ""
      t.string  :status,          :null => false, :default => ""
      t.text    :content,         :null => false, :default => ""
      t.integer :topic_id,        :null => false, :default => ""
      t.integer :professional_id, :null => false, :default => ""
      t.integer :locale_id,       :null => false, :default => 0
      t.timestamps
    end

    # make slug unique
    add_index :guides, :slug, :unique => true
  end
end
