class AddStripeIdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :stripe_id, :string, :null => false, :default => ""
  end
end
