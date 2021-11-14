require "rails_helper"

RSpec.describe OrdersController, ".destroy", type: :controller do
  let(:order) { create(:order) }

  it "returns a successful record information" do
    delete(
      :destroy,
      params: {
        id: order.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
