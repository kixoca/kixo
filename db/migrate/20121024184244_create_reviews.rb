class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text    :comment,         :null => false, :default => ""
      t.integer :rating_id,       :null => false, :default => 0
      t.integer :professional_id, :null => false, :default => 0
      t.integer :user_id,         :null => false, :default => 0
      t.integer :locale_id,       :null => false, :default => 1
      t.timestamps
    end
  end
end
