class Discount < ApplicationRecord
  acts_as_api
  has_paper_trail

  # Relations
  belongs_to :product

  # Attributes
  validates :product_id, :date_start, :date_end, presence: true
  validates :num_products, presence: true, numericality: { only_integer: true }
  validates :pay_only, numericality: { only_integer: true }
  validates :price, numericality: true

  api_accessible :base do |template|
    template.add :date_start
    template.add :date_end
    template.add :num_products
    template.add :pay_only
    template.add :price
  end

  # Class Methods
  class << self
    def with_product(product)
      where(product: product)
    end

    def within_dates(date)
      where("date_start <= :date AND date_end >= :date", date: date)
    end

    def product_discount(product_id, quantity, price, date)
      # Se podria trabajar para que varios descuentos aplicaran sobre el mismo
      # producto. al desconocer las reglas del negocio se opta por esta solucion
      discount = Discount.with_product(product_id).within_dates(date).first

      # No discounts
      return quantity * price if discount.blank?

      discount.apply_discount(quantity, price)
    end
  end

  def apply_discount(quantity, product_price)
    # Descuento por compras superiores a una cantidad
    if pay_only.zero?
      discount_volume(quantity, product_price)
    # El descuento es del tipo 2-for-1 o 3-for-2
    else
      discount_pay_only(quantity, product_price)
    end
  end

  def discount_pay_only(quantity, product_price)
    ((quantity / num_products) * pay_only * product_price) +
      ((quantity % num_products) * product_price)
  end

  def discount_volume(quantity, product_price)
    if quantity >= num_products
      quantity * price
    else
      quantity * product_price
    end
  end
end
