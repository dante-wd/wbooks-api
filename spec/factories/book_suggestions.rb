FactoryBot.define do
  factory :book_suggestion do
    editorial { "MyString" }
    price { 1.5 }
    author { "MyString" }
    title { "MyString" }
    link { "MyString" }
    publisher { "MyString" }
    year { "MyString" }
    user_id { nil }
  end
end
