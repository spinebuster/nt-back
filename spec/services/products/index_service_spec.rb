require "rails_helper"

RSpec.describe Products::IndexService, type: :model do
  include Pagy::Backend

  before do
    # Crear 45 products
    @products = (0..44).map do
      create(:product)
    end
  end

  context "with all products" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(nil, items: 50)
    end

    it "returns total count of records" do
      expect(
        execution[:total_count],
      ).to eql(
        @products.size,
      )
    end

    it "returns all the products" do
      expect(
        execution[:records],
      ).to eq(
        @products.as_api_response(:base),
      )
    end
  end

  describe "with paginated products" do
    context "with first page" do
      subject(:execution) { service.execute! }

      let(:service) do
        described_class.new(nil, page: 1)
      end

      it "returns total count of records" do
        expect(
          execution[:total_count],
        ).to eql(
          @products.size,
        )
      end

      it "returns the first 30 products" do
        _pagy, records = pagy(Product, page: 1).as_api_response(:base)
        expect(
          execution[:records],
        ).to eq(
          records,
        )
      end
    end

    context "with second page" do
      subject(:execution) { service.execute! }

      let(:service) do
        described_class.new(nil, page: 2)
      end

      it "returns total count of records" do
        expect(
          execution[:total_count],
        ).to eql(
          @products.size,
        )
      end

      it "returns the second 30 products" do
        _pagy, records = pagy(Product, page: 2).as_api_response(:base)
        expect(
          execution[:records],
        ).to eq(
          records,
        )
      end
    end
  end
end
