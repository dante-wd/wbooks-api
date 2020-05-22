require 'factory_bot'

FactoryBot.define do
  factory :user do
    user {'user'}
    password {'1234'}
    password_confirmation {'1234'}
    email {'mail@test.com'}
    first_name {'dante'}
    last_name {'asdf'}
  end
end