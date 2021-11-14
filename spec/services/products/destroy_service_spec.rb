require "rails_helper"

RSpec.describe Products::DestroyService, type: :model do
  let(:product) { create(:product) }
  let(:service) do
    described_class.new(nil, id: product.id)
  end

  context "with existing record" do
    subject(:execution) { service.execute! }

    before do
      # Ensure the product is created before running tests
      product
    end

    it "destroys the record" do
      expect { execution }.to change(Product, :count).by(-1)
    end

    it "returns the record information" do
      expect(execution).to eql(product.as_api_response(:base))
    end
    # with existing record
  end

  context "without existing record" do
    subject(:execution) { service.execute! }

    before do
      product.destroy
    end

    it "raises an error" do
      expect { execution }.to raise_error(ActiveRecord::RecordNotFound)
    end
    # with valid attributes
  end
end
