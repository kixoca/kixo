class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.references :advertiser

      t.references :locale, :null => false, :default => 0

      t.string            :format
      t.has_attached_file :visual
      t.string            :destination

      t.integer :views_count,  :null => false, :default => 0
      t.integer :clicks_count, :null => false, :default => 0

      t.integer :max_views
      t.integer :max_clicks

      t.timestamps
      t.datetime :expires_at
      t.datetime :deleted_at
    end
  end
end
