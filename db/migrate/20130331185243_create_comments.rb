class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text       :comment,     :null => false, :default => ""
      t.references :commentable, :null => false, :default => 0, :polymorphic => true
      t.references :author,      :null => false, :default => 0
      t.timestamps
      t.datetime :deleted_at
    end

    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, :author_id
  end
end
