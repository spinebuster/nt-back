require "rails_helper"

RSpec.describe Products::Discounts::IndexService, type: :model do
  include Pagy::Backend

  let(:product) { create(:product) }

  before do
    # Crear 45 discounts
    @discounts = (0..44).map do
      create(:discount, product: product)
    end
  end

  context "with all discounts" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(product, items: 50)
    end

    it "returns total count of records" do
      expect(
        execution[:total_count],
      ).to eql(
        @discounts.size,
      )
    end

    it "returns all the discounts" do
      expect(
        execution[:records],
      ).to eq(
        @discounts.as_api_response(:base),
      )
    end
  end

  describe "with paginated discounts" do
    context "with first page" do
      subject(:execution) { service.execute! }

      let(:service) do
        described_class.new(product, page: 1)
      end

      it "returns total count of records" do
        expect(
          execution[:total_count],
        ).to eql(
          @discounts.size,
        )
      end

      it "returns the first 30 discounts" do
        _pagy, records = pagy(Discount, page: 1).as_api_response(:base)
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
          @discounts.size,
        )
      end

      it "returns the second 30 discounts" do
        _pagy, records = pagy(Discount, page: 2).as_api_response(:base)
        expect(
          execution[:records],
        ).to eq(
          records,
        )
      end
    end
  end
end
