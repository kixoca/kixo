class CreateCountryNames < ActiveRecord::Migration
  def change
    create_table :country_names do |t|
      t.string  :name,       :null => false, :default => ""
      t.integer :locale_id,  :null => false, :default => 0
      t.integer :country_id, :null => false, :default => 0
    end
  end
end
