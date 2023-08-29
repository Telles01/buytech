# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Product.destroy_all

peter = User.create!({
  name: "Peter",
  surname: "Parker",
  address: "Queens",
  city: "New York",
  phone_number: 98798743992,
  email: "spidey@gmail.com",
  password: "123123"
  })

  steve = User.create!({
    name: "Steve",
    surname: "Rogers",
    address: "Brooklyn",
    city: "New York",
    phone_number: 99879874128,
    email: "cap@gmail.com",
    password: "123123"
    })

  tony = User.create!({
    name: "Tony",
    surname: "Stark",
    address: "Malibu",
    city: "Los Angeles",
    phone_number: 98887966432,
    email: "iamironman@gmail.com",
    password: "123123"
  })
  Product.create!({
    name: "Power bank",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    units: 3,
    price: 10.5,
    owner: peter
  })
  Product.create!({
    name: "Power bank",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    units: 3,
    price: 13,
    owner: steve
  })
  Product.create!({
    name: "Gamer Mouse",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    units: 5,
    price: 35,
    owner: peter
  })
  Product.create!({
    name: "Gamer Keyboard",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    units: 2,
    price: 30,
    owner: tony
  })
  Product.create!({
    name: "flash drive 64Gb",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    units: 8,
    price: 18.5,
    owner: tony
  })


p "Created #{User.count} users"
