FactoryBot.define do
  factory :book do
    title		{ Faker::Book.title }
    author		{ Faker::Book.author }
    image		{ Faker::Avatar.image }
    genre		{ Faker::Book.genre }
    publisher	{ Faker::Book.publisher }
    year		{ Faker::Date.birthday(min_age: 1, max_age: 95).year }
  end
end
