class CreateEagerBeavers < ActiveRecord::Migration
  def change
    create_table :eager_beavers do |t|
      t.string :email, :null => false, :default => ""
      t.timestamps
    end
  end
end
