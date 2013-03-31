class CreateTaxonomies < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string     :type

      # parent-child relationship
      t.references :parent

      # used to set 'importance'
      t.integer    :rank

      # geolocation
      t.float      :latitude
      t.float      :longitude

      # counter counts
      t.integer    :users_count,         :null => false, :default => 0
      t.integer    :questions_count,     :null => false, :default => 0
      t.integer    :guides_count,        :null => false, :default => 0
      t.integer    :categories_count,    :null => false, :default => 0
      t.integer    :topics_count,        :null => false, :default => 0
      t.integer    :professions_count,   :null => false, :default => 0
      t.integer    :countries_count,     :null => false, :default => 0
      t.integer    :regions_count,       :null => false, :default => 0
      t.integer    :localities_count,    :null => false, :default => 0
    end
  end
end
