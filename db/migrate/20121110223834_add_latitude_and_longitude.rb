class AddLatitudeAndLongitude < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float

    add_column :representants, :latitude, :float
    add_column :representants, :longitude, :float

    add_column :professionals, :latitude, :float
    add_column :professionals, :longitude, :float
  end
end
