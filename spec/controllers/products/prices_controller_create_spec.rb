# frozen_string_literal: true

require "rails_helper"

RSpec.describe(
  Products::PricesController, ".create", type: :controller
) do
  let(:product) { create(:product) }

  context "with valid attributes" do
    it "returns a successful record information" do
      post(
        :create,
        params: {
          product_id: product.id,
          price: {
            date: Faker::Date.backward(days: 14),
            price: Faker::Number.decimal(l_digits: 2),
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
      post(
        :create,
        params: {
          product_id: product.id,
          price: {
            date: nil,
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(false)
    end
  end
  # with invalid attributes
end
