module Orders
  # This is the Orders index service
  class IndexService < ApplicationService
    include ActsAsIndexable

    def execute!
      indexable(Order.includes(order_products: :product))
    end
  end
end
