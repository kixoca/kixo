class CreateQuestionVisibilities < ActiveRecord::Migration
  def change
    create_table :question_visibilities do |t|
      t.string :name, :null => false, :default => ""
    end

    add_index :question_visibilities, :name, :unique => true
  end
end
