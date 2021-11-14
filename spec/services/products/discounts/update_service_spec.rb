require "rails_helper"

RSpec.describe Products::Discounts::UpdateService, type: :model do
  let(:new_date_end) { Faker::Date.forward(days: 5) }
  let(:product) { create(:product) }
  let(:discount) { create(:discount, product: product) }

  context "with valid attributes" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(
        product,
        id: discount.id,
        discount: {
          date_end: new_date_end,
        },
      )
    end

    it "does not add or delete a record" do
      discount # Ensure record is created
      expect { execution }.to change(Discount, :count).by(0)
    end

    it "attributeses have changed" do
      execution
      discount.reload
      expect(discount.date_end).to eq(new_date_end)
    end

    it "returns a successful record information" do
      expect(execution).to eql(discount.reload.as_api_response(:base))
    end
    # with valid attributes
  end

  context "with invalid attributes" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(
        product,
        id: discount.id,
        discount: {
          date_start: nil,
        },
      )
    end

    it "raises an error" do
      expect { execution }.to raise_error(ActiveRecord::RecordInvalid)
    end
    # with invalid attributes
  end
end
