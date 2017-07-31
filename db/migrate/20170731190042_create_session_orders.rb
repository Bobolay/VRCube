class CreateSessionOrders < ActiveRecord::Migration
  def change
    create_table :session_orders do |t|
      t.string :name
      t.string :phone
      t.datetime :datetime
      t.integer :players_count
      t.string :duration

      t.timestamps null: false
    end
  end
end
