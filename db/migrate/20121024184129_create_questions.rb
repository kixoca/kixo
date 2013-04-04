class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string     :title,          :null => false, :default => ""
      t.text       :details
      t.boolean    :is_private,     :null => false, :default => false
      t.references :status,         :null => false, :default => 0
      t.references :author,         :null => false, :default => 0
      t.references :locale,         :null => false, :default => 0
      t.integer    :answers_count,  :null => false, :default => 0
      t.integer    :comments_count, :null => false, :default => 0
      t.timestamps
    end
  end
end
