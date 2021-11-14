# frozen_string_literal: true

require "rails_helper"

RSpec.describe(
  Products::PricesController, ".update", type: :controller
) do
  let(:product) { create(:product) }
  let(:price) { create(:price, product: product) }

  context "with valid attributes" do
    it "returns a successful record information" do
      put(
        :update,
        params: {
          product_id: product.id,
          id: price.id,
          price: {
            date: Faker::Date.forward(days: 15),
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(true)
    end
    # with valid attributes
  end

  context "with invalid attributes" do
    it "returns a unsuccessful record information" do
      put(
        :update,
        params: {
          product_id: product.id,
          id: price.id,
          price: {
            date: nil,
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(false)
    end
    # with inalid attributes
  end
end
