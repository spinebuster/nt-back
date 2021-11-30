require "rails_helper"

RSpec.describe Store, type: :model do
  describe "definition" do
    subject { store }

    let(:store) { build(:store) }

    it { is_expected.to have_many(:orders) }
    # it { is_expected.to have_many(:product_stores).dependent(:destroy) }
    # it { is_expected.to have_many(:products).through(:product_stores) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:email) }

    it do
      %w[blah blah@puff].each do |v|
        expect(store).not_to allow_value(v).for(:email)
      end
    end

    it { is_expected.to allow_value("pepe@juan.com").for(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:phone) }
    # definition
  end
end
