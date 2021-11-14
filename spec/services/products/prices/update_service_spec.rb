require "rails_helper"

RSpec.describe Products::Prices::UpdateService, type: :model do
  let(:new_price) { Faker::Number.decimal(l_digits: 2) }
  let(:product) { create(:product) }
  let(:price) { create(:price, product: product) }

  context "with valid attributes" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(
        product,
        id: price.id,
        price: {
          price: new_price,
        },
      )
    end

    it "does not add or delete a record" do
      price # Ensure record is created
      expect { execution }.to change(Price, :count).by(0)
    end

    it "attributeses have changed" do
      execution
      price.reload
      expect(price.price).to eql(new_price)
    end

    it "returns a successful record information" do
      expect(execution).to eql(price.reload.as_api_response(:base))
    end
    # with valid attributes
  end

  context "with invalid attributes" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(
        product,
        id: price.id,
        price: {
          price: nil,
        },
      )
    end

    it "raises an error" do
      expect { execution }.to raise_error(ActiveRecord::RecordInvalid)
    end
    # with invalid attributes
  end
end
