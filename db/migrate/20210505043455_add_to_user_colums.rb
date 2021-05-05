class AddToUserColums < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :plan, :string
    add_column :users, :stripe_customer_id, :string
    add_column :users, :subscription_status, :string
  end
end
