pass = Faker::Internet.password

FactoryBot.define do
  factory :user do
    email						      { Faker::Internet.email }
    password					    { pass }
    password_confirmation { pass }
    first_name					  { Faker::Name.first_name }
    last_name					    { Faker::Name.last_name }
  end
end