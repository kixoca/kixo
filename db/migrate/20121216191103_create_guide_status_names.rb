class CreateGuideStatusNames < ActiveRecord::Migration
  def change
    create_table :guide_status_names do |t|
      t.string  :name,            :null => false, :default => ""
      t.integer :locale_id,       :null => false, :default => 0
      t.integer :guide_status_id, :null => false, :default => 0
      t.timestamps
    end
  end
end
