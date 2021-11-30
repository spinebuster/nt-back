require "rails_helper"

RSpec.describe Stores::CreateService, type: :model do
  subject(:execution) { service.execute! }

  let(:service) do
    described_class.new(
      nil,
      store: {
        name: Faker::Lorem.characters(number: 10),
        address: Faker::Address.full_address,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
      },
    )
  end

  it "creates a new record" do
    expect { execution }.to change(Store, :count).by(1)
  end

  it "returns a successful record information" do
    expect(execution).to eql(
      Store.last.as_api_response(:base),
    )
  end
end
