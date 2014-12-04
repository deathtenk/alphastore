class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.datetime :placed_at
      t.decimal :total, default: 0.0
      t.timestamps
    end
  end
end
