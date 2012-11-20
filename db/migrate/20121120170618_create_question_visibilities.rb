class CreateQuestionVisibilities < ActiveRecord::Migration
  def change
    create_table :question_visibilities do |t|
      t.string :name, :null => false, :default => ""
    end
  end
end
