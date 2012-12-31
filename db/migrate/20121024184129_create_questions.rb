class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string     :title,         :null => false, :default => ""
      t.text       :details
      t.references :status,     :null => false, :default => 0
      t.references :visibility, :null => false, :default => 0
      t.references :author,     :null => false, :default => 0, :polymorphic => {:default => "User"}
      t.references :locale,     :null => false, :default => 0
      t.timestamps
    end
  end
end
