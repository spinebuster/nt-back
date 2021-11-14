class Order < ApplicationRecord
  acts_as_api
  has_paper_trail

  # Relations
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  # Attributes
  validates :code, numericality: {
    only_integer: true,
    allow_nil: false,
  }
  validates :date, presence: true

  api_accessible :base do |template|
    template.add :id
    template.add :code
    template.add :date
    template.add :price
    template.add :order_products
  end

  # Callbacks
  before_validation :set_code

  # Class Methods
  class << self
    def create_with_products(products, date = nil)
      date ||= Time.zone.today

      Order.transaction do
        order = Order.create!(date: date)
        products&.each do |product|
          order.order_products.create!(product_id: product, date: date, code: order.code)
        end
        order
      end
    end
  end

  # Para recalcular el importe de la orden con cada insercción de producto
  # def recalculate_price!
  #   update_attributes(
  #     price: order_with_discounts(date)
  #   )
  # end

  def price
    order_with_discounts(date)
  end

  private

  def set_code
    # Si no hay fecha no seguir
    return unless date

    # Generar uno automatico. Hay que buscar las ordenes
    max_order = Order.maximum("code")
    self.code = (max_order || 0) + 1
  end

  def order_with_discounts(date)
    ops_grouped = order_products.group_by(&:product_id)
    ops_grouped.reduce(0) do |result, (product_id, op_grouped)|
      result +
        Discount.product_discount(
          product_id,
          op_grouped.size,
          op_grouped.first.price,
          date,
        )
    end
  end
end
