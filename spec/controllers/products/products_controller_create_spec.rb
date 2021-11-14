require "rails_helper"

RSpec.describe ProductsController, ".create", type: :controller do
  context "with valid attributes" do
    it "returns a successful record information" do
      post(
        :create,
        params: {
          product: {
            code: Faker::Number.number(digits: 9),
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
      post(
        :create,
        params: {
          product: {
            name: nil,
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(false)
    end
  end
  # with invalid attributes
end
