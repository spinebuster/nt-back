require "rails_helper"

RSpec.describe ProductsController, ".index", type: :controller do
  it "returns a successful record information" do
    get(
      :index,
      params: {
        format: "json",
      },
    )
    expect(response.body).to be_json_success(true)
  end
end
