# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

stores =
  Store.create!(
    [
      {
        name: "Store1",
        address: "Address1",
        email: "test@test.com",
        phone: "5556677",
      }, {
        name: "Store2",
        address: "Address2",
        email: "test2@test.com",
        phone: "5556677",
      }
    ]
  )

products =
  Product.create!(
    [
      {
        code: "VOUCHER",
        name: "Gift Card",
      }, {
        code: "TSHIRT ",
        name: "Summer T-Shirt",
      }, {
        code: "PANTS",
        name: "Summer Pants",
      }
    ]
  )

now = DateTime.now
products.first.prices.create!(price: 10, date: now)
products.second.prices.create!(price: 20, date: now)
products.third.prices.create!(price: 15, date: now)

stores.first.orders.create_with_products([products.first.id, products.second.id], now)
stores.second.orders.create_with_products([products.second.id], now)
stores.first.orders.create_with_products([products.second.id, products.third.id], now)
