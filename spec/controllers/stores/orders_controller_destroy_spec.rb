require "rails_helper"

RSpec.describe(
  Stores::OrdersController, ".destroy", type: :controller
) do
  let(:store) { create(:store) }
  let(:order) { create(:order, store: store) }

  it "returns a successful record information" do
    delete(
      :destroy,
      params: {
        store_id: store.id,
        id: order.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
