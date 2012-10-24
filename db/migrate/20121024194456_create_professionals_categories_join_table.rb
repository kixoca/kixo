class CreateProfessionalsCategoriesJoinTable < ActiveRecord::Migration
  def change
    create_table :professionals_categories, :id => false do |t|
      t.integer :professional_id
      t.integer :category_id
    end
  end
end
