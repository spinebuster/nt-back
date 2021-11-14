require "rails_helper"

RSpec.describe Products::Discounts::ShowService, type: :model do
  subject(:execution) { service.execute! }

  let(:product) { create(:product) }
  let(:discount) { create(:discount, product: product) }

  let(:service) do
    described_class.new(product, id: discount.id)
  end

  it "returns a successful product information" do
    expect(execution).to eql(discount.as_api_response(:base))
  end
end
