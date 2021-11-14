class Product < ApplicationRecord
  acts_as_api
  has_paper_trail

  # Relations
  has_many :discounts, dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :prices, dependent: :destroy

  # Attributes
  validates :code, :name, presence: true
  validate  :with_uniq_code

  api_accessible :base do |template|
    template.add :code
    template.add :name
  end

  # Callbacks
  # Se podria crear un precio inicial al crear el producto
  # after_save :set_initial_price

  # Class Methods
  class << self
    def with_code(code)
      where(code: code)
    end

    def without_id(id)
      where.not(id: id)
    end
  end

  def current_price(date = nil)
    date ||= Time.zone.today
    price =
      prices.till_date(
        date,
      ).order(
        date: :desc,
      ).first
    price ? price.price : 0.00
  end

  private

  def with_uniq_code
    return unless unique_scope.with_code(code).exists?

    errors.add(:code, I18n.t("validations.product.code_exists"))
  end

  def unique_scope
    new_record? ? Product : Product.without_id(id)
  end

  # def set_initial_price
  #   prices.create!(
  #     product: self,
  #     date: Date.parse('01-01-1900'),
  #     price: 0.00
  #   )
  # end
end
