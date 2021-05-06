class CreateTableTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :code

      t.timestamps
    end
  end
end
