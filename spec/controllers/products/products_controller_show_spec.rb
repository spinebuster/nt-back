require "rails_helper"

RSpec.describe ProductsController, ".show", type: :controller do
  let(:product) { create(:product) }

  it "returns the product information" do
    get(
      :show,
      params: {
        id: product.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
