# frozen_string_literal: true

require "rails_helper"

RSpec.describe(
  Products::DiscountsController, ".show", type: :controller
) do
  let(:product) { create(:product) }
  let(:discount) { create(:discount, product: product) }

  it "returns the product information" do
    get(
      :show,
      params: {
        product_id: product.id,
        id: discount.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
