class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string  :name,          :null => false, :default => ""
      t.decimal :amount,        :null => false, :default => 0, :precision => 8, :scale => 2
      t.string  :currency,      :null => false, :default => ""
      t.string  :interval,      :null => false, :default => ""
      t.integer :interval_count
      t.integer :trial_period_days
      t.timestamps
    end
  end
end
