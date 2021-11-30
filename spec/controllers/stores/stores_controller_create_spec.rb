require "rails_helper"

RSpec.describe StoresController, ".create", type: :controller do
  context "with valid attributes" do
    it "returns a successful record information" do
      post(
        :create,
        params: {
          store: {
            name: Faker::Lorem.characters(number: 10),
            address: Faker::Address.full_address,
            email: Faker::Internet.email,
            phone: Faker::PhoneNumber.phone_number,
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
      post(
        :create,
        params: {
          store: {
            name: nil,
          },
          format: "json",
        },
      )
      expect(response.body).to be_json_success(false)
    end
  end
  # with invalid attributes
end
