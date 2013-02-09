class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, :null => false, :default => 0
      t.references :plan, :null => false, :default => 0
      t.timestamps
    end
  end
end
