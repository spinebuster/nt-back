require "rails_helper"

RSpec.describe Orders::UpdateService, type: :model do
  let(:new_date) { Faker::Date.backward(days: 14) }
  let(:products) do
    [
      create(
        :product,
        code: "VOUCHER",
        name: "Gift Card",
      ),
      create(
        :product,
        code: "TSHIRT ",
        name: "Summer T-Shirt",
      ),
      create(
        :product,
        code: "PANTS",
        name: "Summer Pants",
      ),
    ]
  end
  let(:order) do
    Order.create_with_products(products.pluck(:id), Faker::Date.backward(days: 14))
  end

  context "with valid attributes" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(
        nil,
        id: order.id,
        order: {
          date: new_date,
        },
      )
    end

    it "does not add or delete a record" do
      order # Ensure record is created
      expect { execution }.to change(Order, :count).by(0)
    end

    it "attributeses have changed" do
      execution
      order.reload
      expect(order.date).to eq(new_date)
    end

    it "returns a successful record information" do
      expect(execution).to eql(order.reload.as_api_response(:base))
    end
    # with valid attributes
  end

  context "with invalid attributes" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(
        nil,
        id: order.id,
        order: {
          date: nil,
        },
      )
    end

    it "raises an error" do
      expect { execution }.to raise_error(ActiveRecord::RecordInvalid)
    end
    # with invalid attributes
  end
end
