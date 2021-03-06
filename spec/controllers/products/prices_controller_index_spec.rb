require "rails_helper"

RSpec.describe(
  Products::PricesController, ".index", type: :controller
) do
  let(:product) { create(:product) }

  it "returns a successful record information" do
    get(
      :index,
      params: {
        product_id: product.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
