class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user,    :null => false, :default => 0
      t.string     :message, :null => false, :default => 0
      t.string     :link_to
      t.boolean    :seen,    :null => false, :default => false
      t.timestamps
    end
  end
end
