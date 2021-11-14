require "rails_helper"

RSpec.describe Products::CreateService, type: :model do
  subject(:execution) { service.execute! }

  let(:service) do
    described_class.new(
      nil,
      product: {
        code: Faker::Number.number(digits: 9),
        name: Faker::Lorem.characters(number: 10),
      },
    )
  end

  it "creates a new record" do
    expect { execution }.to change(Product, :count).by(1)
  end

  it "returns a successful record information" do
    expect(execution).to eql(
      Product.last.as_api_response(:base),
    )
  end
end
