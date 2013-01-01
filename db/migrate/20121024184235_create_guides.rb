class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string     :title,        :null => false, :default => ""
      t.string     :excerpt,      :null => false, :default => ""
      t.text       :content,      :null => false, :default => ""
      t.references :author,       :null => false, :default => 0, :polymorphic => {:default => "Professional"}
      t.timestamps
    end
  end
end
