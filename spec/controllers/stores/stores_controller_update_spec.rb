require "rails_helper"

RSpec.describe StoresController, ".update", type: :controller do
  let(:store) { create(:store) }

  context "with valid attributes" do
    it "returns a successful record information" do
      put(
        :update,
        params: {
          id: store.id,
          store: {
            address: Faker::Address.full_address,
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
          id: store.id,
          store: {
            address: nil,
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(false)
    end
    # with inalid attributes
  end
end
