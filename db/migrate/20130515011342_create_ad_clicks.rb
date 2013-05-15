class CreateAdClicks < ActiveRecord::Migration
  def change
    create_table :ad_clicks do |t|
      t.references :ad, :null => false, :default => 0

      t.references :locale, :null => false, :default => 0

      t.references :clicker

      t.string :ip

      t.timestamps
    end
  end
end
