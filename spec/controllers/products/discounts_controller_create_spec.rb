require "rails_helper"

RSpec.describe(
  Products::DiscountsController, ".create", type: :controller
) do
  let(:product) { create(:product) }

  context "with valid attributes" do
    it "returns a successful record information" do
      post(
        :create,
        params: {
          product_id: product.id,
          discount: {
            date_start: Faker::Date.forward(days: 2),
            date_end: Faker::Date.forward(days: 5),
            num_products: Faker::Number.between(from: 0, to: 10_000),
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
          discount: {
            date_end: nil,
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(false)
    end
  end
  # with invalid attributes
end
