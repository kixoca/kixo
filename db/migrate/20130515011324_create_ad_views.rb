class CreateAdViews < ActiveRecord::Migration
  def change
    create_table :ad_views do |t|
      t.references :ad, :null => false, :default => 0

      t.references :locale, :null => false, :default => 0

      t.references :viewer

      t.string :ip

      t.timestamps
    end
  end
end
