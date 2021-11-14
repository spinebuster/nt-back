FactoryBot.define do
  factory :price do
    date  { Faker::Date.backward(days: 14) }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
