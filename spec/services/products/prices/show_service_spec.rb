require "rails_helper"

RSpec.describe Products::Prices::ShowService, type: :model do
  subject(:execution) { service.execute! }

  let(:product) { create(:product) }
  let(:price) { create(:price, product: product) }

  let(:service) do
    described_class.new(product, id: price.id)
  end

  it "returns a successful product information" do
    expect(execution).to eql(price.as_api_response(:base))
  end
end
