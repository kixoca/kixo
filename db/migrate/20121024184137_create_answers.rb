class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text       :answer,         :null => false, :default => ""
      t.references :question,       :null => false, :default => 0
      t.references :author,         :null => false, :default => 0
      t.integer    :comments_count, :null => false, :default => 0
      t.timestamps
    end
  end
end
