FactoryBot.define do
  factory :discount do
    date_start   { Faker::Date.forward(days: 2) }
    date_end     { Faker::Date.forward(days: 5) }
    num_products { Faker::Number.between(from: 0, to: 10_000) }
  end
end
