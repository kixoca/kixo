class CreateTaxonomies < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string     :type
      t.references :parent
      t.integer    :rank
      t.float      :latitude
      t.float      :longitude
    end
  end
end
