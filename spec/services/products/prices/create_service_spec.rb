require "rails_helper"

RSpec.describe Products::Prices::CreateService, type: :model do
  subject(:execution) { service.execute! }

  let(:product) { create(:product) }
  let(:service) do
    described_class.new(
      product,
      price: {
        date: Faker::Date.backward(days: 14),
        price: Faker::Number.decimal(l_digits: 2),
      },
    )
  end

  it "creates a new record" do
    expect { execution }.to change(Price, :count).by(1)
  end

  it "returns a successful record information" do
    expect(execution).to eql(
      Price.last.as_api_response(:base),
    )
  end
end
