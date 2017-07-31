class CreateHomeOrders < ActiveRecord::Migration
  def change
    create_table :home_orders do |t|
      t.string :address
      t.string :name
      t.string :phone
      t.datetime :datetime
      t.integer :players_count
      t.string :duration

      t.timestamps null: false
    end
  end
end
