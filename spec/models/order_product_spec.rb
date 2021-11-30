require "rails_helper"

RSpec.describe OrderProduct, type: :model do
  let(:store) { create(:store) }
  let(:product) { create(:product) }
  let(:order) { create(:order, store: store) }

  describe "definition" do
    subject { order_product }

    let(:order_product) do
      create(
        :order_product,
        product: product,
        order: order,
      )
    end

    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }

    it { is_expected.to validate_presence_of(:date) }
  end

  describe "calculate order product price" do
    let(:prices) do
      [
        create(
          :price,
          product: product,
          date: Time.zone.today,
        ),
        create(
          :price,
          product: product,
          date: Time.zone.today - 5.days,
        ),
        create(
          :price,
          product: product,
          date: Time.zone.today - 10.days,
        ),
      ]
    end

    describe "with order created today" do
      let(:order_product) do
        create(
          :order_product,
          order: order,
          product: product,
          date: Time.zone.today,
        )
      end

      before do
        prices
      end

      it { expect(order_product.price).to eql(prices.first.price) }
    end

    describe "with order created yesterday" do
      let(:order_product) do
        create(
          :order_product,
          order: order,
          product: product,
          date: Time.zone.today - 1.day,
        )
      end

      before do
        prices
      end

      it { expect(order_product.price).to eql(prices.second.price) }
    end

    describe "with order created 6 days ago" do
      let(:order_product) do
        create(
          :order_product,
          order: order,
          product: product,
          date: Time.zone.today - 6.days,
        )
      end

      before do
        prices
      end

      it { expect(order_product.price).to eql(prices.third.price) }
    end
  end
end
