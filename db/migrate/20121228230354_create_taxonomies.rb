class CreateTaxonomies < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string  :type
      t.integer :parent_id
      t.integer :order,    :null => false, :default => 0
      t.timestamps
    end
  end
end
