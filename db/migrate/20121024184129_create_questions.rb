class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title,           :null => false, :default => ""
      t.text    :details
      t.string  :status,          :null => false, :default => 0
      t.integer :user_id,         :null => false, :default => 0
      t.timestamps
    end
  end
end