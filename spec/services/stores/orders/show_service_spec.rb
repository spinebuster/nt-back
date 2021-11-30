require "rails_helper"

RSpec.describe Stores::Orders::ShowService, type: :model do
  subject(:execution) { service.execute! }

  let(:store) { create(:store) }
  let(:order) { create(:order, store: store) }
  let(:service) do
    described_class.new(store, id: order.id)
  end

  it "returns a successful order information" do
    expect(execution).to eql(order.as_api_response(:base))
  end
end
