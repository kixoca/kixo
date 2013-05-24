class AddMixpanelIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mixpanel_id, :string, :null => false, :default => ""
  end
end
