FactoryBot.define do
  factory :product do
    code { Faker::Number.number(digits: 9) }
    name { Faker::Lorem.characters(number: 10) }
  end
end
