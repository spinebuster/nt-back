require "rails_helper"

RSpec.describe Stores::Orders::DestroyService, type: :model do
  let(:store) { create(:store) }
  let(:order) { create(:order, store: store) }
  let(:service) do
    described_class.new(store, id: order.id)
  end

  context "with existing record" do
    subject(:execution) { service.execute! }

    before do
      # Ensure the order is created before running tests
      order
    end

    it "destroys the record" do
      expect { execution }.to change(Order, :count).by(-1)
    end

    it "returns the record information" do
      expect(execution).to eql(order.as_api_response(:base))
    end
    # with existing record
  end

  context "without existing record" do
    subject(:execution) { service.execute! }

    before do
      order.destroy
    end

    it "raises an error" do
      expect { execution }.to raise_error(ActiveRecord::RecordNotFound)
    end
    # with valid attributes
  end
end
