require "rails_helper"

RSpec.describe(
  Products::PricesController, ".show", type: :controller
) do
  let(:product) { create(:product) }
  let(:price) { create(:price, product: product) }

  it "returns the product information" do
    get(
      :show,
      params: {
        product_id: product.id,
        id: price.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
