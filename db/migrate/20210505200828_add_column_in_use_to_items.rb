class AddColumnInUseToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :in_use, :boolean, default:false
  end
end
