class AddGeolocalizationToTaxonomies < ActiveRecord::Migration
  def change
    add_column :taxonomies, :latitude,  :float
    add_column :taxonomies, :longitude, :float
  end
end
