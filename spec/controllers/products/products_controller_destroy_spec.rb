require "rails_helper"

RSpec.describe ProductsController, ".destroy", type: :controller do
  let(:product) { create(:product) }

  it "returns a successful record information" do
    delete(
      :destroy,
      params: {
        id: product.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
