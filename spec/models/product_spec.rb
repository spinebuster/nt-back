require "rails_helper"

RSpec.describe Product, type: :model do
  describe "definition" do
    subject { product }

    let(:product) { build(:product) }

    it { is_expected.to have_many(:discounts) }
    it { is_expected.to have_many(:order_products) }
    it { is_expected.to have_many(:prices) }

    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "validations" do
    describe "new product" do
      let(:product) do
        create(:product)
      end

      it { expect(product).to be_valid }

      describe "product with same code" do
        subject do
          build(
            :product,
            code: product.code,
            name: Faker::Lorem.characters(number: 10),
          )
        end

        it { is_expected.not_to be_valid }
      end
    end
  end

  describe "calculate current price" do
    let(:product) do
      create(:product)
    end

    describe "with no explicit prices" do
      it { expect(product.current_price).to be_zero }
    end

    describe "with explicit prices" do
      describe "with a price in the future and no date given" do
        before do
          create(
            :price,
            product: product,
            date: Time.zone.today + 5.days,
          )
        end

        it { expect(product.current_price).to be_zero }
      end

      describe "with a price in the past and no date given" do
        before do
          @price =
            create(
              :price,
              product: product,
              date: Time.zone.today - 5.days,
            )
        end

        it { expect(product.current_price).to eql(@price.price) }
      end

      describe "with a price in the future and a date given" do
        before do
          @price =
            create(
              :price,
              product: product,
              date: Time.zone.today + 5.days,
            )
        end

        it { expect(product.current_price(Time.zone.today + 4)).to be_zero }

        it {
          expect(product.current_price(Time.zone.today + 5)).to eql(@price.price)
        }
      end

      describe "with a price in the past and a date given" do
        before do
          @price =
            create(
              :price,
              product: product,
              date: Time.zone.today - 5.days,
            )
        end

        it { expect(product.current_price(Time.zone.today - 6)).to be_zero }

        it {
          expect(product.current_price(Time.zone.today - 5)).to eql(@price.price)
        }
      end

      describe "with a couple of prices" do
        before do
          @older_price =
            create(
              :price,
              product: product,
              date: Time.zone.today - 6.days,
            )
          @recent_price =
            create(
              :price,
              product: product,
              date: Time.zone.today - 5.days,
            )
        end

        it { expect(product.current_price).to eql(@recent_price.price) }

        it {
          expect(
            product.current_price(Time.zone.today - 5),
          ).to eql(
            @recent_price.price,
          )
        }

        it {
          expect(
            product.current_price(Time.zone.today + 5),
          ).to eql(
            @recent_price.price,
          )
        }

        it {
          expect(
            product.current_price(Time.zone.today - 6),
          ).to eql(
            @older_price.price,
          )
        }
      end
    end
  end
end
