# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  Product.delete_all
  Order.delete_all

  30.times do
    Product.create(
      name:         Faker::Commerce.product_name,
      price:        Faker::Commerce.price,
      image_url:    Faker::Avatar.image(nil, "50x50"),
      description:  Faker::Lorem.paragraph
      )
  end
end

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
