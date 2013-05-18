class AddMixpanelIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :mixpanel_id, :string, :null => false, :default => ""

    User.all.each do |user|
      user.create_mixpanel_id
      user.save
    end
  end

  def down
    remove_column :users, :mixpanel_id
  end
end
