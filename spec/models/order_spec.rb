require "rails_helper"

RSpec.describe Order, type: :model do
  describe "definition" do
    subject { order }

    let(:store) { create(:store) }
    let(:order) do
      build(:order, store: store)
    end

    it { is_expected.to belong_to(:store) }
    it { is_expected.to have_many(:order_products).dependent(:destroy) }
    it { is_expected.to have_many(:products).through(:order_products) }

    it { is_expected.to validate_presence_of(:date) }
  end

  describe "setting the code" do
    let(:store) { create(:store) }
    let(:order) do
      build(:order, store: store)
    end

    it { expect(order.code).not_to be_nil }
  end

  describe "incremental code" do
    describe "first code should be one" do
      let(:store) { create(:store) }
      let(:first_order) do
        create(:order, store: store)
      end

      it { expect(first_order.code).to be(1) }

      describe "second order should be two" do
        let(:second_order) do
          first_order
          create(:order, store: store)
        end

        it { expect(second_order.code).to be(2) }
      end
    end
  end

  describe "calculate price" do
    let(:store) { create(:store) }
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

    let(:prices) do
      [
        create(
          :price,
          product: products.first,
          date: Time.zone.today,
          price: 5.00,
        ),
        create(
          :price,
          product: products.second,
          date: Time.zone.today,
          price: 20.00,
        ),
        create(
          :price,
          product: products.third,
          date: Time.zone.today,
          price: 7.50,
        ),
      ]
    end

    let(:discounts) do
      [
        create(
          :discount,
          product: products.first,
          date_start: Time.zone.today,
          date_end: Time.zone.today + 10.days,
          num_products: 2,
          pay_only: 1,
        ),
        create(
          :discount,
          product: products.second,
          date_start: Time.zone.today,
          date_end: Time.zone.today + 10.days,
          num_products: 3,
          price: 19.00,
        ),
      ]
    end

    describe "example1: 3 different items no discounts" do
      let(:order_products) do
        [products.first.id, products.second.id, products.third.id]
      end
      let(:order) do
        store.orders.create_with_products(order_products, Time.zone.today)
      end

      before do
        prices
        discounts
      end

      it { expect(order.price).to be(32.50) }
    end

    describe "example2: 3 items with a 2-for-1 discount" do
      let(:order_products) do
        [products.first.id, products.second.id, products.first.id]
      end
      let(:order) do
        store.orders.create_with_products(order_products, Time.zone.today)
      end

      before do
        prices
        discounts
      end

      it { expect(order.price).to be(25.00) }
    end

    describe "example3: 5 items with a discount for volume" do
      let(:order_products) do
        [
          products.second.id, products.second.id, products.second.id,
          products.first.id, products.second.id
        ]
      end
      let(:order) do
        store.orders.create_with_products(order_products, Time.zone.today)
      end

      before do
        prices
        discounts
      end

      it { expect(order.price).to be(81.00) }
    end

    describe(
      "example4: 7 items with a discount for volume a 2-for-1 discount",
    ) do
      let(:order_products) do
        [
          products.first.id, products.second.id, products.first.id,
          products.first.id, products.third.id, products.second.id,
          products.second.id
        ]
      end
      let(:order) do
        store.orders.create_with_products(order_products, Time.zone.today)
      end

      before do
        prices
        discounts
      end

      it { expect(order.price).to be(74.50) }
    end
  end
end
