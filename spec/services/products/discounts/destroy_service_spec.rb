require "rails_helper"

RSpec.describe Products::Discounts::DestroyService, type: :model do
  let(:product) { create(:product) }
  let(:discount) { create(:discount, product: product) }
  let(:service) do
    described_class.new(product, id: discount.id)
  end

  context "with existing record" do
    subject(:execution) { service.execute! }

    before do
      # Ensure the discount is created before running tests
      discount
    end

    it "destroys the record" do
      expect { execution }.to change(Discount, :count).by(-1)
    end

    it "returns the record information" do
      expect(execution).to eql(discount.as_api_response(:base))
    end
    # with existing record
  end

  context "without existing record" do
    subject(:execution) { service.execute! }

    before do
      discount.destroy
    end

    it "raises an error" do
      expect { execution }.to raise_error(ActiveRecord::RecordNotFound)
    end
    # with valid attributes
  end
end
