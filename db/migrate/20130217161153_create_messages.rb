class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :conversation, :null => false, :default => 0
      t.references :author,       :null => false, :default => 0
      t.boolean    :read,         :null => false, :default => false
      t.string     :message
      t.timestamps
      t.datetime :deleted_at
    end
  end
end
