class CreateQuestionStatuses < ActiveRecord::Migration
  def change
    create_table :question_statuses do |t|
      t.string :name, :null => false, :default => ""
    end

    add_index :question_statuses, :name, :unique => true
  end
end
