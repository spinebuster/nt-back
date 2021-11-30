# This will guess the Store class
FactoryBot.define do
  factory :store do
    name    { Faker::Lorem.characters(number: 10) }
    address { Faker::Address.full_address }
    email   { Faker::Internet.email }
    phone   { Faker::PhoneNumber.phone_number }
  end
end
