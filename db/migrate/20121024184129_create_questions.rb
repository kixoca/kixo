class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string     :title,         :null => false, :default => ""
      t.text       :details
      t.references :author,     :null => false, :default => 0, :polymorphic => {:default => "User"}
      t.timestamps
    end
  end
end
