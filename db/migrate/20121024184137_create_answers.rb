class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text    :details,     :null => false, :default => ""
      t.integer :question_id, :null => false, :default => 0
      t.integer :author_id,   :null => false, :default => 0
      t.string  :author_type, :null => false, :default => ""
      t.timestamps
    end
  end
end
