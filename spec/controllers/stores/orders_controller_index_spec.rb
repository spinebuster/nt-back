require "rails_helper"

RSpec.describe(
  Stores::OrdersController, ".index", type: :controller
) do
  let(:store) { create(:store) }

  it "returns a successful record information" do
    get(
      :index,
      params: {
        store_id: store.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
