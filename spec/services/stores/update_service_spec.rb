require "rails_helper"

RSpec.describe Stores::UpdateService, type: :model do
  let(:new_name) { Faker::Lorem.characters(number: 10) }
  let(:store) { create(:store) }

  context "with valid attributes" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(
        nil,
        id: store.id,
        store: {
          name: new_name,
        },
      )
    end

    it "does not add or delete a record" do
      store # Ensure record is created
      expect { execution }.to change(Store, :count).by(0)
    end

    it "attributeses have changed" do
      execution
      store.reload
      expect(store.name).to eql(new_name)
    end

    it "returns a successful record information" do
      expect(execution).to eql(store.reload.as_api_response(:base))
    end
    # with valid attributes
  end

  context "with invalid attributes" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(
        nil,
        id: store.id,
        store: {
          name: nil,
        },
      )
    end

    it "raises an error" do
      expect { execution }.to raise_error(ActiveRecord::RecordInvalid)
    end
    # with invalid attributes
  end
end
