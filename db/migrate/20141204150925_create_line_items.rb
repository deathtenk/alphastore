class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.integer :quantity, default: 1, null: false
      t.decimal :price, default: 0.0
      t.timestamps
    end
  end
end
