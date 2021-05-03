class AddColumnPlanToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :plan, :string, null: false, default: "free"
  end
end
