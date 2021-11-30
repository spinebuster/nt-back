require "rails_helper"

RSpec.describe(
  Stores::OrdersController, ".update", type: :controller
) do
  let(:store) { create(:store) }
  let(:order) { create(:order, store: store) }

  context "with valid attributes" do
    it "returns a successful record information" do
      put(
        :update,
        params: {
          store_id: store.id,
          id: order.id,
          order: {
            date: Faker::Date.backward(days: 14),
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
          store_id: store.id,
          id: order.id,
          order: {
            date: nil,
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(false)
    end
    # with inalid attributes
  end
end
