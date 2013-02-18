class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :from,   :null => false, :default => 0
      t.references :to,     :null => false, :default => 0
      t.string     :content
      t.boolean    :read,   :null => false, :default => false
      t.timestamps
    end
  end
end
