class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string     :title,          :null => false, :default => ""
      t.text       :details
      t.boolean    :is_private,     :null => false, :default => false
      t.references :status,         :null => false, :default => 0
      t.references :author,         :null => false, :default => 0

      # localization
      t.references :locale,         :null => false, :default => 0

      # geolocation
      t.references :locality, :null => false, :default => 0
      t.float      :latitude
      t.float      :longitude

      # counters
      t.integer    :answers_count,  :null => false, :default => 0
      t.integer    :comments_count, :null => false, :default => 0

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
