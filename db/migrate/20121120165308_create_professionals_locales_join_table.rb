class CreateProfessionalsLocalesJoinTable < ActiveRecord::Migration
  def change
    create_table :professionals_locales, :id => false do |t|
      t.integer :professional_id
      t.integer :locale_id
    end
  end
end
