require "rails_helper"

RSpec.describe Stores::IndexService, type: :model do
  include Pagy::Backend

  before do
    # Crear 45 stores
    @stores = (0..44).map do
      create(:store)
    end
  end

  context "with all stores" do
    subject(:execution) { service.execute! }

    let(:service) do
      described_class.new(nil, items: 50)
    end

    it "returns total count of records" do
      expect(
        execution[:total_count],
      ).to eql(
        @stores.size,
      )
    end

    it "returns all the stores" do
      expect(
        execution[:records],
      ).to eq(
        @stores.as_api_response(:base),
      )
    end
  end

  describe "with paginated stores" do
    context "with first page" do
      subject(:execution) { service.execute! }

      let(:service) do
        described_class.new(nil, page: 1)
      end

      it "returns total count of records" do
        expect(
          execution[:total_count],
        ).to eql(
          @stores.size,
        )
      end

      it "returns the first 30 stores" do
        _pagy, records = pagy(Store, page: 1).as_api_response(:base)
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
          @stores.size,
        )
      end

      it "returns the second 30 stores" do
        _pagy, records = pagy(Store, page: 2).as_api_response(:base)
        expect(
          execution[:records],
        ).to eq(
          records,
        )
      end
    end
  end
end
