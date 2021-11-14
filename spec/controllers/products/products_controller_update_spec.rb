require "rails_helper"

RSpec.describe ProductsController, ".update", type: :controller do
  let(:product) { create(:product) }

  context "with valid attributes" do
    it "returns a successful record information" do
      put(
        :update,
        params: {
          id: product.id,
          product: {
            name: Faker::Lorem.characters(number: 10),
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
          id: product.id,
          product: {
            name: nil,
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(false)
    end
    # with inalid attributes
  end
end
