require "rails_helper"

RSpec.describe Orders::ShowService, type: :model do
  subject(:execution) { service.execute! }

  let(:order) { create(:order) }
  let(:service) do
    described_class.new(nil, id: order.id)
  end

  it "returns a successful order information" do
    expect(execution).to eql(order.as_api_response(:base))
  end
end
