require "rails_helper"

RSpec.describe Products::Discounts::CreateService, type: :model do
  subject(:execution) { service.execute! }

  let(:product) { create(:product) }
  let(:service) do
    described_class.new(
      product,
      discount: {
        date_start: Faker::Date.forward(days: 2),
        date_end: Faker::Date.forward(days: 5),
        num_products: Faker::Number.between(from: 0, to: 10_000),
      },
    )
  end

  it "creates a new record" do
    expect { execution }.to change(Discount, :count).by(1)
  end

  it "returns a successful record information" do
    expect(execution).to eql(
      Discount.last.as_api_response(:base),
    )
  end
end
