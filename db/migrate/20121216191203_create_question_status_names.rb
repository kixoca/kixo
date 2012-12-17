class CreateQuestionStatusNames < ActiveRecord::Migration
  def change
    create_table :question_status_names do |t|
      t.string  :name,               :null => false, :default => ""
      t.integer :locale_id,          :null => false, :default => 0
      t.integer :question_status_id, :null => false, :default => 0
    end
  end
end
