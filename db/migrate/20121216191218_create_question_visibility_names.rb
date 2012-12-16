class CreateQuestionVisibilityNames < ActiveRecord::Migration
  def change
    create_table :question_visibility_names do |t|
      t.string  :name,                   :null => false, :default => ""
      t.integer :locale_id,              :null => false, :default => 0
      t.integer :question_visibility_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
