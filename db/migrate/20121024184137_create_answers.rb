class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text       :details,  :null => false, :default => ""
      t.references :question, :null => false, :default => 0
      t.references :author,   :null => false, :default => 0
      t.timestamps
    end
  end
end
