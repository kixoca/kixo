class CreateGeolocalizations < ActiveRecord::Migration
  def change
    create_table :geolocalizations do |t|
      t.references :geolocalizable, :null => false, :default => 0, :polymorphic => true
      t.references :address,        :null => false, :default => 0, :polymorphic => true
      t.timestamps
    end

    add_index :geolocalizations, [:geolocalizable_id, :geolocalizable_type, :address_id, :address_type], :unique => true, :name => "index_geolocalizable_address"
    add_index :geolocalizations, [:address_id, :address_type, :geolocalizable_id, :geolocalizable_type], :unique => true, :name => "index_address_geolocalizable"
  end
end
