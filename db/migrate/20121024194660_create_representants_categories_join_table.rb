class CreateRepresentantsCategoriesJoinTable < ActiveRecord::Migration
  def change
    create_table :representants_categories, :id => false do |t|
      t.integer :representant_id
      t.integer :category_id
    end
  end
end
