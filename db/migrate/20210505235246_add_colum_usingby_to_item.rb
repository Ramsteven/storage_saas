class AddColumUsingbyToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :using_by, :string, default: :null
  end
end
