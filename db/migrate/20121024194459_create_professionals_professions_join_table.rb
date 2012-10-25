class CreateProfessionalsProfessionsJoinTable < ActiveRecord::Migration
  def change
    create_table :professionals_professions, :id => false do |t|
      t.integer :professional_id
      t.integer :profession_id
    end
  end
end
