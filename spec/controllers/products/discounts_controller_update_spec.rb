# frozen_string_literal: true

require "rails_helper"

RSpec.describe(
  Products::DiscountsController, ".update", type: :controller
) do
  let(:product) { create(:product) }
  let(:discount) { create(:discount, product: product) }

  context "with valid attributes" do
    it "returns a successful record information" do
      put(
        :update,
        params: {
          product_id: product.id,
          id: discount.id,
          discount: {
            date_end: Faker::Date.forward(days: 15),
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
          id: discount.id,
          discount: {
            date_end: nil,
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(false)
    end
    # with inalid attributes
  end
end
