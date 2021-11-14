FactoryBot.define do
  factory :order_product do
    date  { Faker::Date.backward(days: 14) }
    code  { Faker::Number.number(digits: 9) }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
