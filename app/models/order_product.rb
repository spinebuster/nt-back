class OrderProduct < ApplicationRecord
  acts_as_api
  has_paper_trail

  # Relations
  belongs_to :order
  belongs_to :product

  # Attributes
  validates :order_id, :product_id, :date, presence: true
  validates :code, numericality: {
    only_integer: true,
    allow_nil: false,
  }
  validates :price, numericality: {
    allow_nil: false,
  }

  api_accessible :base do |template|
    template.add :date
    template.add :code
    template.add :price
    template.add :product
  end

  # Callbacks
  before_validation :set_price
  # Se puede pensar en que el precio de la order se vaya calculando cada vez
  # que metemos un producto
  # after_save :set_order_price

  private

  def set_price
    # Si no hay fecha o no hay producto no seguir
    return if date.blank? || product.blank?

    # El precio del producto de la orden se guarda dependiendo de la fecha que
    # tenga el producto en el momento de ejecutar la orden segun la lista
    # de precios
    self.price = product.current_price(date)
  end

  # def set_order_price
  #   order.recalculate_price
  # end
end
