require "rails_helper"

RSpec.describe(
  Products::PricesController, ".destroy", type: :controller
) do
  let(:product) { create(:product) }
  let(:price) { create(:price, product: product) }

  it "returns a successful record information" do
    delete(
      :destroy,
      params: {
        product_id: product.id,
        id: price.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
