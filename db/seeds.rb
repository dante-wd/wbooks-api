# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
28.times do 
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    image: Faker::Avatar.image,
    genre: Faker::Book.genre,
    publisher: Faker::Book.publisher,
    year: Faker::Date.birthday(min_age: 1, max_age: 95).year
  )
end