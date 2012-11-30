class AddProfessionalBio < ActiveRecord::Migration
  def change
    add_column :professionals, :bio, :text
  end
end
