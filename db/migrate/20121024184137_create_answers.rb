class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text    :details,         :null => false, :default => ""
      t.integer :question_id,     :null => false, :default => ""
      t.integer :professional_id, :null => false, :default => ""
      t.timestamps
    end
  end
end
