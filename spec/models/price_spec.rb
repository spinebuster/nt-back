require "rails_helper"

RSpec.describe Price, type: :model do
  let(:product) { create(:product) }

  describe "definition" do
    subject { price }

    let(:price) { build(:price, product: product) }

    it { is_expected.to belong_to(:product) }

    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
  end
end
