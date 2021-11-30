require "rails_helper"

RSpec.describe(
  Stores::OrdersController, ".create", type: :controller
) do
  let(:store) { create(:store) }

  context "with valid attributes" do
    it "returns a successful record information" do
      post(
        :create,
        params: {
          store_id: store.id,
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
          store_id: store.id,
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
