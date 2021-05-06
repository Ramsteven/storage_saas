class AddColumnToBoxes < ActiveRecord::Migration[6.1]
  def change
    add_column :boxes, :code, :string
  end
end
