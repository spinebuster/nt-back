require "rails_helper"

RSpec.describe OrdersController, ".show", type: :controller do
  let(:order) { create(:order) }

  it "returns the order information" do
    get(
      :show,
      params: {
        id: order.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
