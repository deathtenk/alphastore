class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2
      t.decimal :vote, default: 0
      t.timestamps
    end
  end
end
