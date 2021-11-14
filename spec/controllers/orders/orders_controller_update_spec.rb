require "rails_helper"

RSpec.describe OrdersController, ".update", type: :controller do
  let(:order) { create(:order) }

  context "with valid attributes" do
    it "returns a successful record information" do
      put(
        :update,
        params: {
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
