require "rails_helper"

RSpec.describe OrdersController, ".create", type: :controller do
  context "with valid attributes" do
    it "returns a successful record information" do
      post(
        :create,
        params: {
          order: {
            date: Faker::Date.backward(days: 14),
          },
          products_id: [],
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
          order: {
            date: nil,
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(false)
    end
  end
  # with invalid attributes
end
