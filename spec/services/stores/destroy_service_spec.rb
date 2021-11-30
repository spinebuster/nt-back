require "rails_helper"

RSpec.describe Stores::DestroyService, type: :model do
  let(:store) { create(:store) }
  let(:service) do
    described_class.new(nil, id: store.id)
  end

  context "with existing record" do
    subject(:execution) { service.execute! }

    before do
      # Ensure the store is created before running tests
      store
    end

    it "destroys the record" do
      expect { execution }.to change(Store, :count).by(-1)
    end

    it "returns the record information" do
      expect(execution).to eql(store.as_api_response(:base))
    end
    # with existing record
  end

  context "without existing record" do
    subject(:execution) { service.execute! }

    before do
      store.destroy
    end

    it "raises an error" do
      expect { execution }.to raise_error(ActiveRecord::RecordNotFound)
    end
    # with valid attributes
  end
end
