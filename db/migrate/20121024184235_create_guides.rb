class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string     :title,   :null => false, :default => ""
      t.string     :excerpt, :null => false, :default => ""
      t.text       :content, :null => false, :default => ""
      t.references :status,  :null => false, :default => 0
      t.references :author,  :null => false, :default => 0
      t.references :locale,  :null => false, :default => 0
      t.timestamps
    end
  end
end
