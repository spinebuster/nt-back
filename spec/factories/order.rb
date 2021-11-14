FactoryBot.define do
  factory :order do
    date { Faker::Date.backward(days: 14) }
    code { Faker::Number.number(digits: 9) }
  end
end
