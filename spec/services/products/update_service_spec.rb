require "rails_helper"

RSpec.describe Products::UpdateService, type: :model do
  let(:new_name) { Faker::Lorem.characters(number: 10) }
  let(:product) { create(:product) }

  context "with valid attributes" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(
        nil,
        id: product.id,
        product: {
          name: new_name,
        },
      )
    end

    it "does not add or delete a record" do
      product # Ensure record is created
      expect { execution }.to change(Product, :count).by(0)
    end

    it "attributeses have changed" do
      execution
      product.reload
      expect(product.name).to eql(new_name)
    end

    it "returns a successful record information" do
      expect(execution).to eql(product.reload.as_api_response(:base))
    end
    # with valid attributes
  end

  context "with invalid attributes" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(
        nil,
        id: product.id,
        product: {
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
