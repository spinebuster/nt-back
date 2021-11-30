require "rails_helper"

RSpec.describe Stores::ShowService, type: :model do
  subject(:execution) { service.execute! }

  let(:store) { create(:store) }
  let(:service) do
    described_class.new(nil, id: store.id)
  end

  it "returns a successful store information" do
    expect(execution).to eql(store.as_api_response(:base))
  end
end
