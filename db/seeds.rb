# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

peter = User.create!({
  name: "Peter",
  surname: "Parker",
  address: "Queens",
  city: "New York",
  phone_number: 987987432,
  email: "spidey@gmail.com",
  password: "123123"
  })
  # product = Product.new
  # product.owner = peter
  # product.save

User.create!({
  name: "Steve",
  surname: "Rogers",
  address: "Brooklyn",
  city: "New York",
  phone_number: 987987412,
  email: "cap@gmail.com",
  password: "123123"
  })
User.create!({
  name: "Tony",
  surname: "Stark",
  address: "Malibu",
  city: "Los Angeles",
  phone_number: 987966432,
  email: "iamironman@gmail.com",
  password: "123123"
})

p "Created #{User.count} users"
