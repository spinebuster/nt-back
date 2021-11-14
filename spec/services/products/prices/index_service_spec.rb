require "rails_helper"

RSpec.describe Products::Prices::IndexService, type: :model do
  include Pagy::Backend

  let(:product) { create(:product) }

  before do
    # Crear 45 prices
    @prices = (0..44).map do
      create(:price, product: product)
    end
  end

  context "with all prices" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(product, items: 50)
    end

    it "returns total count of records" do
      expect(
        execution[:total_count],
      ).to eql(
        @prices.size,
      )
    end

    it "returns all the prices" do
      expect(
        execution[:records],
      ).to eq(
        @prices.as_api_response(:base),
      )
    end
  end

  describe "with paginated prices" do
    context "with first page" do
      subject(:execution) { service.execute! }

      let(:service) do
        described_class.new(product, page: 1)
      end

      it "returns total count of records" do
        expect(
          execution[:total_count],
        ).to eql(
          @prices.size,
        )
      end

      it "returns the first 30 prices" do
        _pagy, records = pagy(Price, page: 1).as_api_response(:base)
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
        described_class.new(product, page: 2)
      end

      it "returns total count of records" do
        expect(
          execution[:total_count],
        ).to eql(
          @prices.size,
        )
      end

      it "returns the second 30 prices" do
        _pagy, records = pagy(Price, page: 2).as_api_response(:base)
        expect(
          execution[:records],
        ).to eq(
          records,
        )
      end
    end
  end
end
