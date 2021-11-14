require "rails_helper"

RSpec.describe Products::ShowService, type: :model do
  subject(:execution) { service.execute! }

  let(:product) { create(:product) }
  let(:service) do
    described_class.new(nil, id: product.id)
  end

  it "returns a successful product information" do
    expect(execution).to eql(product.as_api_response(:base))
  end
end
