module Stores
  module Orders
    # This is the Orders index service
    class IndexService < ApplicationService
      include ActsAsIndexable

      def execute!
        indexable(@main_object.orders.includes(order_products: :product))
      end
    end
  end
end
