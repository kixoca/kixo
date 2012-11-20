class CreateQuestionStatuses < ActiveRecord::Migration
  def change
    create_table :question_statuses do |t|
      t.string :name, :null => false, :default => ""
    end
  end
end
