require "rails_helper"

RSpec.describe Orders::CreateService, type: :model do
  subject(:execution) { service.execute! }

  let(:products) do
    [
      create(
        :product,
        code: "VOUCHER",
        name: "Gift Card",
      ),
      create(
        :product,
        code: "TSHIRT ",
        name: "Summer T-Shirt",
      ),
      create(
        :product,
        code: "PANTS",
        name: "Summer Pants",
      ),
    ]
  end
  let(:service) do
    described_class.new(
      nil,
      order: {
        date: Faker::Date.backward(days: 14),
      },
      products_id: products.pluck(:id),
    )
  end

  it "creates a new record" do
    expect { execution }.to change(Order, :count).by(1)
  end

  it "returns a successful record information" do
    expect(execution).to eql(
      Order.last.as_api_response(:base),
    )
  end
end
