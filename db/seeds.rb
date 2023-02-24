# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
User.destroy_all

puts "Creating 4 users..."

user1 = User.create!(
  username: "Charlotte",
  email: "charlotte@trip.com",
  password: "1234567",
  avatar: "https://images.unsplash.com/photo-1666030931740-adfdd279c5d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1544&q=80",
)

user2 = User.create!(
  username: "Julie",
  email: "julie@trip.com",
  password: "1234567",
  avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
)

user3 = User.create!(
  username: "Marine",
  email: "marine@trip.com",
  password: "1234567",
  avatar: "https://images.unsplash.com/photo-1647642891405-fc8a70cab67f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80",
)

user4 = User.create!(
  username: "Kevin",
  email: "kevin@trip.com",
  password: "1234567",
  avatar: "https://images.unsplash.com/photo-1598155523122-3842334d2c17?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
)
