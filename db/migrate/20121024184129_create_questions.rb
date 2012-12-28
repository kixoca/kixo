class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title,         :null => false, :default => ""
      t.text    :details
      t.string  :status_id,     :null => false, :default => 0
      t.integer :visibility_id, :null => false, :default => 0
      t.integer :author_id,     :null => false, :default => 0
      t.string  :author_type,   :null => false, :default => ""
      t.integer :locale_id,     :null => false, :default => 0
      t.timestamps
    end
  end
end
