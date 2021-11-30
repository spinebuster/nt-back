require "rails_helper"

RSpec.describe StoresController, ".destroy", type: :controller do
  let(:store) { create(:store) }

  it "returns a successful record information" do
    delete(
      :destroy,
      params: {
        id: store.id,
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
