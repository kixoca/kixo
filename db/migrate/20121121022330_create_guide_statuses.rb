class CreateGuideStatuses < ActiveRecord::Migration
  def change
    create_table :guide_statuses do |t|
      t.string :name, :null => false, :default => ""
    end

    add_index :guide_statuses, :name, :unique => true
  end
end
