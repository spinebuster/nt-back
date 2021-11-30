require "rails_helper"

RSpec.describe StoresController, ".show", type: :controller do
  let(:store) { create(:store) }

  it "returns the store information" do
    get(
      :show,
      params: {
        id: store.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
