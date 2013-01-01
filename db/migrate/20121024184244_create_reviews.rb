class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text       :comment,      :null => false, :default => ""
      t.references :professional, :null => false, :default => 0
      t.references :author,       :null => false, :default => 0, :polymorphic => {:default => "User"}
      t.timestamps
    end
  end
end
