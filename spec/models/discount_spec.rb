require "rails_helper"

RSpec.describe Discount, type: :model do
  let(:product) { create(:product) }

  describe "definition" do
    subject { discount }

    let(:discount) { build(:discount, product: product) }

    it { is_expected.to belong_to(:product) }

    it { is_expected.to validate_presence_of(:date_start) }
    it { is_expected.to validate_presence_of(:date_end) }
    it { is_expected.to validate_presence_of(:num_products) }
    it { is_expected.to validate_numericality_of(:num_products).only_integer }
    it { is_expected.to validate_numericality_of(:pay_only).only_integer }
    it { is_expected.to validate_numericality_of(:price) }
  end

  describe "applying discounts" do
    let(:product) { create(:product) }
    let(:prices) do
      build(:price, product: product)
    end

    describe "with no discounts" do
      subject(:product_discount) do
        described_class.product_discount(product.id, 10, 10, Time.zone.today)
      end

      it { expect(product_discount).to eq(100) }
    end

    describe "with a discount in the future" do
      subject(:product_discount) do
        described_class.product_discount(product.id, 10, 10, Time.zone.today)
      end

      before do
        build(
          :discount,
          product: product,
          date_start: Time.zone.today + 1.day,
          date_end: Time.zone.today + 2.days,
        )
      end

      it { expect(product_discount).to eq(100) }
    end

    describe "with a special discount 2-for-1" do
      subject(:product_discount) do
        described_class.product_discount(product.id, 2, 10, Time.zone.today)
      end

      before do
        create(
          :discount,
          product: product,
          date_start: Time.zone.today,
          date_end: Time.zone.today + 1.day,
          num_products: 2,
          pay_only: 1,
        )
      end

      it { expect(product_discount).to eq(10) }
    end

    describe "with a special discount 3-for-2" do
      subject(:product_discount) do
        described_class.product_discount(product.id, 3, 10, Time.zone.today)
      end

      before do
        create(
          :discount,
          product: product,
          date_start: Time.zone.today,
          date_end: Time.zone.today + 1.day,
          num_products: 3,
          pay_only: 2,
        )
      end

      it { expect(product_discount).to eq(20) }
    end

    describe "with a special discount 3-for-2 with more products" do
      subject(:product_discount) do
        described_class.product_discount(product.id, 4, 10, Time.zone.today)
      end

      before do
        create(
          :discount,
          product: product,
          date_start: Time.zone.today,
          date_end: Time.zone.today + 1.day,
          num_products: 3,
          pay_only: 2,
        )
      end

      it { expect(product_discount).to eq(30) }
    end

    describe "with a special discount 4-for-2 with more products" do
      subject(:product_discount) do
        described_class.product_discount(product.id, 7, 10, Time.zone.today)
      end

      before do
        create(
          :discount,
          product: product,
          date_start: Time.zone.today,
          date_end: Time.zone.today + 1.day,
          num_products: 4,
          pay_only: 2,
        )
      end

      it { expect(product_discount).to eq(50) }
    end

    describe "with a discount by volume applied" do
      subject(:product_discount) do
        described_class.product_discount(product.id, 7, 15, Time.zone.today)
      end

      before do
        create(
          :discount,
          product: product,
          date_start: Time.zone.today,
          date_end: Time.zone.today + 1.day,
          num_products: 5,
          price: 10,
        )
      end

      it { expect(product_discount).to eq(70) }
    end
  end
end
