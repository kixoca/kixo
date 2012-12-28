class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text    :comment,         :null => false, :default => ""
      t.integer :rating_id,       :null => false, :default => 0
      t.integer :professional_id, :null => false, :default => 0
      t.integer :author_id,       :null => false, :default => 0
      t.string  :author_type,     :null => false, :default => ""
      t.integer :locale_id,       :null => false, :default => 0
      t.timestamps
    end
  end
end
